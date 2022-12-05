import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/utils/responsive.dart';

class DropdownInput extends StatelessWidget {
  final Key? key;
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
  final List<String>? itens;

  final dropOpcoes = [
    'Pessoa Física',
    'Pessoa Jurídica',
  ];
  final dropValue = ValueNotifier('');

  DropdownInput({
    this.key,
    this.width,
    this.placeholder,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.autofocus = false,
    this.borderColor = MyColors.border,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.itens,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ??
          (Responsive.isDesktop(context)
              ? widthDefaultInput
              : Get.width - defaultPadding / 2),
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: ValueListenableBuilder(
        valueListenable: dropValue,
        builder: (BuildContext context, String value, _) =>
            DropdownButtonFormField<String>(
          key: key,
          isExpanded: true,
          onTap: () => onTap,
          autofocus: autofocus,
          style: const TextStyle(
              height: 0.85, fontSize: 14.0, color: MyColors.initial),
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder,
          ),
          // validator: validator,
          value: (value.isEmpty) ? null : value,
          onChanged: onChanged,
          items: (itens ??
                  []) // Se não for passado a lista, ele inicia uma lista vazia
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          validator: validator,
        ),
      ),
    );
  }
}
