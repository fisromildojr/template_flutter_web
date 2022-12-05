import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/modules/usuario/controller/usuario_controller.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/input-text.dart';
import 'package:template_flutter_web/app/widgets/primary-button.dart';
import 'package:template_flutter_web/app/widgets/text-body.dart';
import 'package:template_flutter_web/app/widgets/title-page.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends GetView<UsuarioController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: defaultPadding * 2,
                  ),
                  child: TitlePage(
                    'Login',
                    color: MyColors.white,
                  ),
                ),
                InputText(
                  controller: controller.usuarioController,
                  name: "Usuário",
                  validator: Validatorless.required('Campo obrigatório'),
                  width: 350,
                  autofocus: true,
                  // upperCaseTextFormatter: false,
                ),
                InputText(
                  controller: controller.passController,
                  name: "Senha",
                  obscureText: true,
                  width: 350,
                  validator: Validatorless.required('Campo obrigatório'),
                  // upperCaseTextFormatter: false,
                  onFieldSubmitted: (_) {
                    controller.cleanErrors();
                    controller.login();
                    // Get.find<InitialController>().backPage();
                  },
                  upperCaseTextFormatter: false,
                ),
                PrimaryButton(
                  width: 350,
                  onPressed: () {
                    controller.cleanErrors();
                    controller.login();
                    // Get.find<InitialController>().backPage();
                  },
                  child: TextBody(
                    'Login',
                    color: MyColors.white,
                  ),
                ),
                Obx(
                  () => controller.hasError
                      ? SizedBox(
                          width: widthDefaultInput,
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding / 2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.shade200,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(defaultPadding),
                                child: TextBody(
                                  controller.error,
                                  color: MyColors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          Obx(
            () => Get.find<InitialController>().isLoading
                ? Container(
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
