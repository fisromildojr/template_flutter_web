import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';

class TextError extends Text {
  TextError(String data)
      : super(data,
            style:
                Get.theme.textTheme.bodyText1?.copyWith(color: MyColors.error));
}
