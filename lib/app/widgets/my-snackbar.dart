import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/widgets/text-body.dart';
import 'package:template_flutter_web/app/widgets/title-body.dart';

class MySnackBar extends SnackBar {
  final String? title;
  final String message;
  MySnackBar({
    Key? key,
    required Color? backgroundColor,
    this.title,
    required this.message,
  }) : super(
          key: key,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) TitleBody(title),
              TextBody(message),
            ],
          ),

          backgroundColor: backgroundColor,
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,

          // margin: Responsive.isDesktop(Get.context!)
          //     ? EdgeInsets.only(
          //         bottom: Get.height * 0.9,
          //         right: defaultPadding,
          //         left: Get.width * 0.7)
          //     : EdgeInsets.only(
          //         bottom: Get.height * 0.9,
          //         right: defaultPadding,
          //         left: defaultPadding),
        );

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: 100,
  //     height: 100,
  //     decoration: BoxDecoration(color: Colors.red),
  //   );
  // }
}
