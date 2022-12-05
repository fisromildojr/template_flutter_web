import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/text-body.dart';

class TextContent extends StatelessWidget {
  final String title;
  final String value;
  final double? width;
  const TextContent({
    Key? key,
    required this.title,
    required this.value,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: width != null ? null : const EdgeInsets.all(defaultPadding),
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
              title,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextBody(
            value,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
