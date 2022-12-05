import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/theme/my_theme.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: Get.isDarkMode,
      onChanged: (value) {
        Get.changeTheme(
          Get.isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme,
        );
      },
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
