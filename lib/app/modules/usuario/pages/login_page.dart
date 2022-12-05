import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/usuario/controller/usuario_controller.dart';
import 'package:template_flutter_web/app/modules/usuario/widgets/login_form.dart';

// ignore: must_be_immutable
class LoginPage extends GetView<UsuarioController> {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final scrollController = ScrollController();

  void selectedTipo(String? tipo) {
    controller.typeSelected(tipo ?? '');
    if (tipo == 'Pessoa Física') {
      controller.typeController.text = 'PhysicalPerson';
    } else {
      controller.typeController.text = 'LegalPerson';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/banner-site.jpg"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Container(
          color: Colors.black54,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Template\nFlutter Web',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              decoration: const BoxDecoration(color: Colors.black54),
              child: const LoginForm(),
            ),
          ],
        ),
      ],
    );
  }
}
