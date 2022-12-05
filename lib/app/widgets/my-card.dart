import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/text-body.dart';

class MyCard extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final Widget? newRow;
  const MyCard({
    Key? key,
    this.title,
    required this.children,
    this.newRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding * 3),
      child: FocusTraversalGroup(
        child: Card(
          margin: EdgeInsets.zero,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.zero,
          // ),
          color: MyColors.secondary,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: TextBody(title!),
                  ),
                Wrap(
                  children: [
                    ...children,
                    Row(), // Só está aqui pra deixar o card expandido
                  ],
                ),
                if (newRow != null) newRow!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
