import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class MyBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final bool dialog;
  final double? width;
  final bool widthInfinity;
  final EdgeInsetsGeometry? padding;
  const MyBackButton({
    Key? key,
    this.onPressed,
    this.child,
    this.dialog = false,
    this.width,
    this.widthInfinity = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthInfinity ? null : width ?? widthDefaultInput / 1.5,
      padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
      child: ElevatedButton(
        style: Get.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(MyColors.btnVoltar),
        ),
        onPressed: onPressed ??
            () =>
                dialog ? Get.back() : Get.find<InitialController>().backPage(),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Text('VOLTAR')
              ],
            ),
      ),
    );
  }
}
