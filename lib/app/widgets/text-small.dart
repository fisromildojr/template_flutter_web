import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextSmall extends Text {
  TextSmall(String data, {Color? color})
      : super(data,
            style: Get.theme.textTheme.bodySmall
                ?.copyWith(color: color, fontSize: 8.0));
}
