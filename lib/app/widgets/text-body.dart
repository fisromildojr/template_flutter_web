import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class TextBody extends Text {
  TextBody(
    String data, {
    Color? color,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? overflow,
    TextStyle? style,
    FontWeight? fontWeight,
    bool lineThrough = true,
  }) : super(
          data,
          style: style ??
              Get.theme.textTheme.bodyText1?.copyWith(
                color: color,
                fontWeight: fontWeight ?? FontWeight.normal,
                decoration: !lineThrough ? TextDecoration.lineThrough : null,
                fontSize: fontSizeInputs,
              ),
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow ?? TextOverflow.visible,
        );
}
