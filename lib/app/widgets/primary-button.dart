import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool widthInfinity;
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width,
    this.padding,
    this.widthInfinity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
      width: widthInfinity ? null : width ?? widthDefaultInput,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Get.theme.elevatedButtonTheme.style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
