import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class EditButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final bool dialog;
  final double? width;
  const EditButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.dialog = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? widthDefaultInput,
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child ??
            const Text(
              'EDITAR',
            ),
      ),
    );
  }
}
