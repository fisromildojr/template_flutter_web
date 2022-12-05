// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';

class MenuModel {
  final String nome;
  final String title;
  final IconData? icon;
  List<MenuModel> tiles;
  final TextStyle? color;
  final TextStyle? hover;
  final Divider? divider;
  final Function()? onTap;

  MenuModel({
    this.nome = '',
    required this.title,
    this.icon = Icons.remove,
    required this.tiles,
    this.color,
    this.hover,
    this.divider,
    this.onTap,
  });

  bool isSelected() {
    return this == Get.find<InitialController>().getMenuSelected;
  }
}
