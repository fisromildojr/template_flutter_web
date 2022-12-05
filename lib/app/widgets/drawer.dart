import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/model/menu/menu_model.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/menu-items.dart';

class DrawerMenu extends GetView<InitialController> {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50,
      backgroundColor: MyColors.white,
      width: widthDrawer,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: defaultPadding / 2,
          left: defaultPadding / 2,
          right: defaultPadding / 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return BuildM(
            menuItems[index],
          );
        },
        itemCount: menuItems.length,
        shrinkWrap: true,
      ),
    );
  }
}

class BuildM extends GetView<InitialController> {
  final MenuModel menuM;
  // final BuildContext context;

  const BuildM(this.menuM, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildMenu(menuM);
  }

  Widget _buildMenu(MenuModel e) {
    //after expanded
    if (e.tiles.isEmpty) {
      return ListTile(
        // selected: true,
        leading: Icon(e.icon),
        title: Text(
          e.title,
        ),
        onTap: e.onTap,
      );
    }

    //without expansion

    return ExpansionTile(
      title: Text(
        e.title,
      ),
      textColor: Get.theme.primaryColor,
      iconColor: Get.theme.primaryColor,
      leading: Icon(e.icon),
      expandedAlignment: Alignment.bottomRight,
      childrenPadding: const EdgeInsets.only(
        left: defaultPadding,
      ),
      children: e.tiles.map(_buildMenu).toList(),
    );
  }
}
