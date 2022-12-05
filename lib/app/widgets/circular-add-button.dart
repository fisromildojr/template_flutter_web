import 'package:flutter/material.dart';

class CircularAddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CircularAddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      icon: const Icon(Icons.add),
    );
  }
}
