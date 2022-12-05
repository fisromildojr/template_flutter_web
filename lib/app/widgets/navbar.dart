import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  final bool backButton;
  final bool transparent;

  final Color bgColor;

  Navbar({
    this.title = "Início",
    this.transparent = false,
    this.backButton = false,
    this.bgColor = MyColors.white,
  });

  final double _prefferedHeight = navBarHeight;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag = '';

  ItemScrollController _scrollController = ItemScrollController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                        !widget.backButton ? Icons.menu : Icons.arrow_back_ios,
                        color: !widget.transparent
                            ? (widget.bgColor == MyColors.white
                                ? MyColors.initial
                                : MyColors.white)
                            : MyColors.white,
                        size: 24.0),
                    onPressed: () {
                      if (!widget.backButton)
                        Scaffold.of(context).openDrawer();
                      else
                        Get.back();
                      // Navigator.pop(context);
                    }),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: !widget.transparent
                        ? (widget.bgColor == MyColors.white
                            ? MyColors.initial
                            : MyColors.white)
                        : MyColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
