import 'dart:developer';

import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template_flutter_web/app/exceptions/api_exception.dart';
import 'package:template_flutter_web/app/exceptions/connection_exception.dart';
import 'package:template_flutter_web/app/exceptions/login_exception.dart';
import 'package:template_flutter_web/app/model/api/response_api_model.dart';
import 'package:template_flutter_web/app/model/dto/login_dto_model.dart';
import 'package:template_flutter_web/app/model/dto/token_dto_model.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/modules/usuario/model/usuario_model.dart';
import 'package:template_flutter_web/app/modules/usuario/repository/usuario_repository.dart';
import 'package:template_flutter_web/app/storage/web-storage.dart';
import 'package:template_flutter_web/app/utils/global_scaffold.dart';
import 'package:template_flutter_web/app/utils/routes/app_routes.dart';
import 'package:template_flutter_web/app/utils/routes/back_routes.dart';
import 'package:template_flutter_web/app/widgets/my-snackbar.dart';

class UsuarioController extends GetxController {
  final UsuarioRepository _apiRepository;
  UsuarioController(this._apiRepository);

  final storage = GetStorage();
  final salt =
      "abc43579jk965p"; // Necessário para gerar as senhas pra realizar o login, sem isso o a senha não vai bater

  // Variáveis do formulário
  final formKey = GlobalKey<FormState>();
  final typeSelected = ''.obs;
  final typeController = TextEditingController();
  final cnpjController = TextEditingController();
  final cpfController = TextEditingController();
  final nameController = TextEditingController();
  final razaoSocialController = TextEditingController();
  final fantasyNameController = TextEditingController();
  final emailController = TextEditingController();
  final usuarioController = TextEditingController();
  final passController = TextEditingController();

  // Variáveis de controle
  final RxBool _isLoading = false.obs;
  final RxBool _hasError = false.obs;
  final RxString _error = "".obs;
  final RxBool _isLoginMode = true.obs;
  // ------------------------------------------

  // Geters
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;
  bool get isLoadingMode => _isLoginMode.value;
  String get error => _error.value;

  // ------------------------------------------

  void limparCampos() {
    typeSelected('');
    typeController.clear();
    cnpjController.clear();
    cpfController.clear();
    nameController.clear();
    razaoSocialController.clear();
    fantasyNameController.clear();
    emailController.clear();
    usuarioController.clear();
    passController.clear();
  }

  void cleanErrors() {
    _hasError(false);
    _error("");
  }

  void toggleMode() => _isLoginMode(!isLoadingMode);

  Future<void> login() async {
    var _isValid = formKey.currentState?.validate() ?? false;
    if (_isValid) {
      try {
        Get.find<InitialController>().setLoading(true);
        var loginDTO = LoginDTO(
          user: usuarioController.text,
          pass: Crypt.sha256(passController.text, salt: salt).toString(),
        );

        print('Senha do Login: => ${loginDTO.pass}');

        ResponseAPI dados =
            await _apiRepository.login(BackRoutes.LOGIN, loginDTO);

        TokenDTO token = TokenDTO.fromJson(dados.objeto);
        WebStorage.instance.setToken(token.token);

        limparCampos(); // Limpa os TextFields

        Get.toNamed(AppRoutes.INITIAL);
        // Get.back();
      } on LoginException catch (e, s) {
        log(s.toString());
        Get.offAllNamed(AppRoutes.LOGIN);
        GlobalScaffold.instance.showSnackbar(
          mySnackBar: MySnackBar(
            title: "Permissão negada",
            message: e.message,
            backgroundColor: Colors.amber.shade200,
          ),
        );
      } on ConnectionException catch (e, s) {
        log(s.toString());
        GlobalScaffold.instance.showSnackbar(
          mySnackBar: MySnackBar(
            title: "Falha",
            message: e.message,
            backgroundColor: Colors.red.shade200,
          ),
        );
      } on APIException catch (e, s) {
        log(s.toString());
        GlobalScaffold.instance.showSnackbar(
          mySnackBar: MySnackBar(
            title: "Falha",
            message: e.message,
            backgroundColor: Colors.red.shade200,
          ),
        );
      } finally {
        Get.find<InitialController>().setLoading(false);
      }
    }
  }

  Future<Usuario?> getCurrentUsuario() async {
    try {
      ResponseAPI dados = await _apiRepository.me();
      Usuario usuario = Usuario.fromJson(dados.objeto);

      // Get.find<InitialController>().usuario = dados.objeto;
      return Usuario.fromJson(dados.objeto);
    } on LoginException catch (e, s) {
      log(s.toString());
      Get.offAllNamed(AppRoutes.LOGIN);
      GlobalScaffold.instance.showSnackbar(
        mySnackBar: MySnackBar(
          title: "Permissão negada",
          message: e.message,
          backgroundColor: Colors.amber.shade200,
        ),
      );
    } on ConnectionException catch (e, s) {
      log(s.toString());
      GlobalScaffold.instance.showSnackbar(
        mySnackBar: MySnackBar(
          title: "Falha",
          message: e.message,
          backgroundColor: Colors.red.shade200,
        ),
      );
    } on APIException catch (e, s) {
      log(s.toString());
      GlobalScaffold.instance.showSnackbar(
        mySnackBar: MySnackBar(
          title: "Falha",
          message: e.message,
          backgroundColor: Colors.red.shade200,
        ),
      );
    }
  }

  Future<bool?> logout() async {
    try {
      ResponseAPI dados = await _apiRepository.logout();
      WebStorage.instance.setToken(null);
      Get.find<InitialController>().setCleanPages();
      Get.offAllNamed(AppRoutes.LOGIN);
      return dados.sucesso;
    } on LoginException catch (e, s) {
      log(s.toString());
      Get.offAllNamed(AppRoutes.LOGIN);
      GlobalScaffold.instance.showSnackbar(
        mySnackBar: MySnackBar(
          title: "Permissão negada",
          message: e.message,
          backgroundColor: Colors.amber.shade200,
        ),
      );
    } on ConnectionException catch (e, s) {
      log(s.toString());
      GlobalScaffold.instance.showSnackbar(
        mySnackBar: MySnackBar(
          title: "Falha",
          message: e.message,
          backgroundColor: Colors.red.shade200,
        ),
      );
    } on APIException catch (e, s) {
      log(s.toString());
      GlobalScaffold.instance.showSnackbar(
        mySnackBar: MySnackBar(
          title: "Falha",
          message: e.message,
          backgroundColor: Colors.red.shade200,
        ),
      );
    }
  }

  @override
  void dispose() {
    typeController.dispose();
    cnpjController.dispose();
    cpfController.dispose();
    nameController.dispose();
    usuarioController.dispose();
    passController.dispose();
    super.dispose();
  }
}
