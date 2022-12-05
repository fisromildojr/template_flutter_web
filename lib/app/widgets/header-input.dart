import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/input-text.dart';

class HeaderInput extends StatelessWidget {
  Key? key;
  final double? width;
  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  final bool obscureText;
  TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final bool? alignCenter;

  HeaderInput({
    this.key,
    this.width,
    this.placeholder,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.controller,
    required this.autofocus,
    required this.borderColor,
    required this.obscureText,
    this.keyboardType,
    this.validator,
    this.backgroundColor,
    this.margin,
    this.alignCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.fromLTRB(0, 0, 0, defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            children: [
              InputText(
                key: key,
                width: width,
                name: placeholder,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                onTap: onTap,
                onChanged: onChanged,
                controller: controller,
                autofocus: autofocus,
                borderColor: borderColor,
                obscureText: obscureText,
                keyboardType: keyboardType,
                validator: validator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
