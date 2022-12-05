import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/title-body.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final bool isSelected;
  // final Color? iconColor;

  DrawerTile({
    required this.title,
    required this.icon,
    this.onTap,
    this.isSelected = false,
    // this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Get.isDarkMode
                    ? MyColors.bgColorScreenDark
                    : MyColors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Icon(icon,
                  size: Theme.of(context).iconTheme.size,
                  color: isSelected
                      ? MyColors.white
                      : Theme.of(context).iconTheme.color),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TitleBody(
                  title,
                  color: isSelected ? MyColors.white : null,
                ),
              )
            ],
          )),
    );
  }
}
