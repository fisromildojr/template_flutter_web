import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/circular-icon-button.dart';
import 'package:template_flutter_web/app/widgets/title-page.dart';

class Header extends StatelessWidget {
  final String title;
  final bool showButton;
  final void Function()? onPressedButton;
  final String labelButton;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Widget? iconButton;
  final bool? alignCenter;

  const Header({
    this.title = '',
    this.labelButton = '',
    this.showButton = false,
    this.onPressedButton,
    this.color,
    this.backgroundColor,
    this.margin,
    this.iconButton,
    this.alignCenter = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: alignCenter == true
                ? Center(
                    child: TitlePage(
                      title,
                      color: color,
                    ),
                  )
                : TitlePage(
                    title,
                    color: color,
                  ),
          ),
          if (showButton)
            CircularIconButton(
              onPressed: onPressedButton ?? () {},
              icon: iconButton ?? const Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}
