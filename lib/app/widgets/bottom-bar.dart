import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/modules/dashboard/pages/dashboard_page.dart';
import 'package:template_flutter_web/app/modules/initial/controllers/initial_controller.dart';
import 'package:template_flutter_web/app/widgets/text-body.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBottomAppBar();
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
      // color: MyColors.textDark,
      child: Obx(
        () => Container(
          height: 60.0,
          // padding: const EdgeInsets.all(defaultPadding / 2),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SizedBox(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.home),
                          color: Get.find<InitialController>().getCurrentPage
                                  is DashboardPage
                              ? Get.theme.primaryColor
                              : null,
                          onPressed: () => Get.find<InitialController>()
                              .setCurrentPage(DashboardPage()),
                        ),
                        TextBody(
                          "Início",
                          color: Get.find<InitialController>().getCurrentPage
                                  is DashboardPage
                              ? Get.theme.primaryColor
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Image.asset(
                            'assets/icons/service-icon.png',
                            scale: 24,
                            // color: Get.find<InitialController>().getCurrentPage
                            //             is ServiceListPage ||
                            //         Get.find<InitialController>().getCurrentPage
                            //             is ServiceByFiltroList
                            //     ? Get.theme.primaryColor
                            //     : null,
                          ),
                          // color: Get.find<InitialController>().getCurrentPage
                          //             is ServiceListPage ||
                          //         Get.find<InitialController>().getCurrentPage
                          //             is ServiceByFiltroList
                          //     ? Get.theme.primaryColor
                          //     : null,
                          // onPressed: () => Get.find<InitialController>()
                          //     .setCurrentPage(ServiceListPage()),
                          onPressed: () {},
                        ),
                        TextBody(
                          "Serviços",
                          // color: Get.find<InitialController>().getCurrentPage
                          //             is ServiceListPage ||
                          //         Get.find<InitialController>().getCurrentPage
                          //             is ServiceByFiltroList
                          //     ? Get.theme.primaryColor
                          //     : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: SizedBox(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.only(top: 13.0),
                          constraints: const BoxConstraints(),
                          icon: Image.asset(
                            'assets/icons/solicitation-service-icon.png',
                            scale: 24,
                            // color: Get.find<InitialController>().getCurrentPage
                            //         is SolicitationPage
                            //     ? Get.theme.primaryColor
                            //     : null,
                          ),
                          // color: Get.find<InitialController>().getCurrentPage
                          //         is SolicitationPage
                          //     ? Get.theme.primaryColor
                          //     : null,
                          //   onPressed: () => Get.find<InitialController>()
                          //       .setCurrentPage(const SolicitationPage()),
                          onPressed: () {},
                        ),
                        TextBody(
                          "Solicitações",
                          // color: Get.find<InitialController>().getCurrentPage
                          //         is SolicitationPage
                          //     ? Get.theme.primaryColor
                          //     : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.person),
                          // color: Get.find<InitialController>().getCurrentPage
                          //         is ProfileUserPage
                          //     ? Get.theme.primaryColor
                          //     : null,
                          // onPressed: () => Get.find<InitialController>()
                          //     .setCurrentPage(ProfileUserPage()),
                          onPressed: () {},
                        ),
                        TextBody(
                          "Perfil",
                          // color: Get.find<InitialController>().getCurrentPage
                          //         is ProfileUserPage
                          //     ? Get.theme.primaryColor
                          //     : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
