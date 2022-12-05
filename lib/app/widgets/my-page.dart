import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/title-page.dart';

class MyPage extends StatelessWidget {
  final String title;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final List<Widget> children;

  MyPage({
    Key? key,
    required this.title,
    this.suffixWidget,
    this.prefixWidget,
    required this.children,
  }) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (prefixWidget != null)
                Padding(
                  padding: const EdgeInsets.only(
                    left: defaultPadding,
                    top: defaultPadding,
                    right: defaultPadding,
                    bottom: defaultPadding * 2,
                  ),
                  child: prefixWidget!,
                ),
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding,
                  top: defaultPadding,
                  right: defaultPadding,
                  bottom: defaultPadding * 2,
                ),
                child: TitlePage(title),
              ),
              Expanded(child: Container()),
              suffixWidget ?? Container(),
            ],
          ),
          FocusTraversalGroup(
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
