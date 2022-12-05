import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus_web/package_info_plus_web.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/utils/responsive.dart';
import 'package:template_flutter_web/app/widgets/drawer.dart';

class InitialPage extends GetView<InitialController> {
  Future getVersion = PackageInfoPlugin().getAll();
  InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: heightTopBar,
                        child: Card(
                          color: MyColors.white,
                          margin: const EdgeInsets.only(bottom: 1.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: defaultPadding),
                              height: 250.0,
                              width: 250.0,
                              child: Get.isDarkMode
                                  ? Image.asset("assets/images/logo-dark.png")
                                  : Image.asset("assets/images/logo.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Responsive.isDesktop(context)) DrawerMenu(),
                      // const DrawerMenu(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: controller.getCurrentPage,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Center(
                child: FutureBuilder<dynamic>(
                    future: getVersion,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Tooltip(
                          message:
                              "Versão: ${snapshot.data.version}+${snapshot.data.buildNumber}",
                          child: Text(
                            "${snapshot.data.version}+${snapshot.data.buildNumber}",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      } else {
                        return Text('');
                      }
                    }),
              ),
            ),
            if (controller.isLoading)
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(20, 131, 131, 131),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      child: Text(
                        'Carregando . . .',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
