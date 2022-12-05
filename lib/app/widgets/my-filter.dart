import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class MyFilter extends StatelessWidget {
  final List<Widget> children;
  const MyFilter({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              ...children,
              Row(), // Só está aqui pra deixar o card expandido
            ],
          ),
        ],
      ),
    );
  }
}
