import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class BtnAdd extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  const BtnAdd({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      margin: const EdgeInsets.only(
        top: 23,
        left: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  color: MyColors.white,
                ),
              )
            : const Icon(
                Icons.add,
                color: MyColors.white,
              ),
      ),
    );
  }
}
