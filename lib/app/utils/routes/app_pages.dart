import 'package:get/route_manager.dart';
import 'package:template_flutter_web/app/modules/initial/bindings/initial_binding.dart';
import 'package:template_flutter_web/app/modules/initial/pages/initial_page.dart';
import 'package:template_flutter_web/app/modules/usuario/pages/login_page.dart';
import 'package:template_flutter_web/app/storage/web-storage.dart';
import 'package:template_flutter_web/app/utils/routes/app_routes.dart';

class AppPages {
  static final INITIAL =
      WebStorage.instance.token == null ? AppRoutes.LOGIN : AppRoutes.INITIAL;
  // AppRoutes.INITIAL;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: InitialBinding(),
    ),
  ];
}
