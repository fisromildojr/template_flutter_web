import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final bool dialog;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool widthInfinity;
  const CancelButton({
    Key? key,
    this.onPressed,
    this.child,
    this.dialog = false,
    this.width,
    this.padding,
    this.widthInfinity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthInfinity ? null : width ?? widthDefaultInput,
      padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
      child: ElevatedButton(
        style: Get.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(MyColors.btnCancelar),
        ),
        onPressed: onPressed ??
            () =>
                dialog ? Get.back() : Get.find<InitialController>().backPage(),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('CANCELAR'),
              ],
            ),
      ),
    );
  }
}
