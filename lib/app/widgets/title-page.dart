import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitlePage extends Text {
  TitlePage(String data, {Color? color})
      : super(data,
            style: Get.theme.textTheme.headline6?.copyWith(color: color));
}
