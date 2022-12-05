import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/widgets/title-body.dart';

class CardExpanded extends StatefulWidget {
  final bool defaultExpanded;
  final String title;
  final String textButton;
  final Icon? iconButton;
  final bool showButton;
  final void Function()? onPressed;
  final Widget? child;
  final bool buttonVisibleOnExpanded;
  const CardExpanded({
    Key? key,
    this.defaultExpanded = false,
    this.title = '',
    this.textButton = '',
    this.iconButton,
    this.showButton = false,
    this.onPressed,
    this.child,
    this.buttonVisibleOnExpanded = false,
  }) : super(key: key);

  @override
  State<CardExpanded> createState() => _CardExpandedState();
}

class _CardExpandedState extends State<CardExpanded>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerAnimation;
  final RxBool _show = false.obs;

  void toggle() {
    _show(!_show.value);
    !widget.defaultExpanded
        ? _show.value
            ? controllerAnimation.forward()
            : controllerAnimation.reverse()
        : _show.value
            ? controllerAnimation.reverse()
            : controllerAnimation.forward();
  }

  @override
  void initState() {
    _show(widget.defaultExpanded);
    controllerAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                children: [
                  InkWell(
                    onTap: toggle,
                    child: AnimatedIcon(
                      size: 15,
                      icon: !widget.defaultExpanded
                          ? AnimatedIcons.menu_close
                          : AnimatedIcons.close_menu,
                      progress: controllerAnimation,
                      semanticLabel: widget.title,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: defaultPadding),
                    child: TitleBody(
                      widget.title,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Visibility(
                    visible: widget.showButton && !_show.value ||
                        widget.buttonVisibleOnExpanded,
                    child: ElevatedButton(
                      onPressed: widget.onPressed,
                      child: Row(
                        children: [
                          widget.iconButton ?? Container(),
                          Text(widget.textButton),
                        ],
                      ),
                      style: const ButtonStyle(),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              height: _show.value ? null : 0.0,
              curve: Curves.elasticInOut,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
