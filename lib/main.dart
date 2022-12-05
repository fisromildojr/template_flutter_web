import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:template_flutter_web/app/theme/my_theme.dart';
import 'package:template_flutter_web/app/utils/global_scaffold.dart';
import 'package:template_flutter_web/app/utils/responsive.dart';
import 'package:template_flutter_web/app/utils/routes/app_pages.dart';
import 'package:template_flutter_web/app/widgets/drawer.dart';

Future<void> main() async {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Template Flutter Web',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffoldKey,
          drawer: !Responsive.isDesktop(context) ? DrawerMenu() : null,
          body: child,
        );
      },
    );
  }
}
