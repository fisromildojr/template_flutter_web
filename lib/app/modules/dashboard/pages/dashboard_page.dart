import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:template_flutter_web/app/widgets/my-page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: 'Dashboard',
      children: [],
    );
  }
}
