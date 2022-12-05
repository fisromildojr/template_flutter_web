import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyFloatingButton extends StatelessWidget {
  final void Function()? onPressed;
  const MyFloatingButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 2,
        right: 15,
        child: FloatingActionButton(
          onPressed: onPressed,
        ));
  }
}
