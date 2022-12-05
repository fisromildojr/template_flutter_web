import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/model/menu/menu_model.dart';
import 'package:template_flutter_web/app/modules/dashboard/pages/dashboard_page.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/modules/usuario/controller/usuario_controller.dart';

var menuItems = <MenuModel>[
  MenuModel(
    icon: Icons.add_to_photos_outlined,
    title: 'Painel de Informações',
    onTap: () => Get.find<InitialController>().setCurrentPage(
      const DashboardPage(),
    ),
    tiles: [],
  ),
  MenuModel(
    icon: Icons.add,
    title: 'Cadastros',
    tiles: [],
  ),
  MenuModel(
    icon: Icons.logout,
    title: 'Sair',
    onTap: () => Get.find<UsuarioController>().logout(),
    tiles: [],
  ),
];
