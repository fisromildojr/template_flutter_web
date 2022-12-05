import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/utils/responsive.dart';
import 'package:template_flutter_web/app/utils/uppercasetextformatter.dart';
import 'package:template_flutter_web/app/widgets/text-body.dart';

class InputText extends StatelessWidget {
  final Key? key;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final String? name;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function(String?)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool show;
  final bool enabled;
  final bool showLabel;
  final bool showPlaceholder;
  final bool upperCaseTextFormatter;

  InputText({
    this.key,
    this.width,
    this.padding,
    this.name,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.borderColor = MyColors.border,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.show = false,
    this.enabled = true,
    this.showLabel = false,
    this.showPlaceholder = false,
    this.upperCaseTextFormatter = true,
  });

  @override
  Widget build(BuildContext context) {
    return show
        ? Container(
            padding:
                width != null ? null : const EdgeInsets.all(defaultPadding),
            constraints: width == null
                ? null
                : const BoxConstraints(minWidth: defaultTextShowContentWidth),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                  child: TextBody(
                    name?.replaceAll('*', '') ?? '',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextBody(
                  controller == null
                      ? '-'
                      : controller!.text.isEmpty
                          ? '-'
                          : controller!.text,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        : Container(
            width: width ??
                (Responsive.isDesktop(context)
                    ? widthDefaultInput
                    : Get.width - defaultPadding / 2),
            padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (name != null && showLabel)
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                    child: TextBody(
                      name!,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                TextFormField(
                  key: key,
                  enabled: enabled,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  cursorColor: MyColors.muted,
                  onTap: () => onTap,
                  onChanged: onChanged,
                  onFieldSubmitted: onFieldSubmitted,
                  controller: controller,
                  autofocus: autofocus,
                  style: const TextStyle(
                    fontSize: fontSizeMenu,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    hintText: showPlaceholder ? name : null,
                  ).applyDefaults(Theme.of(context).inputDecorationTheme),
                  validator: validator,
                  inputFormatters: upperCaseTextFormatter
                      ? [
                          UpperCaseTextFormatter(), //Por padrão, todos ficarão com essa formatação
                          ...inputFormatters ?? [],
                        ]
                      : inputFormatters,
                ),
              ],
            ),
          );
  }
}
