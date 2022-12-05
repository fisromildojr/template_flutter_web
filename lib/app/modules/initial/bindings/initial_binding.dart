import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/modules/usuario/controller/usuario_controller.dart';
import 'package:template_flutter_web/app/modules/usuario/repository/usuario_repository.dart';
import 'package:template_flutter_web/app/utils/rest_client.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Bindings Globals
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => InitialController());

    // Usuario
    Get.lazyPut(() => UsuarioRepository(Get.find()));
    Get.lazyPut(() => UsuarioController(Get.find()));
  }
}
