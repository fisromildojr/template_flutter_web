import 'package:template_flutter_web/app/utils/constants.dart';

class BackRoutes {
  static const baseUrl = https ? URL_BACK : URL_LOCAL;

  static const URL_BACK = 'https://meuback.app';
  // static const URL_LOCAL = 'http://192.168.3.9:8080';
  static const URL_LOCAL = 'http://192.168.2.120:8080';

  // Login
  static const LOGIN = '/auth'; // Login
  static const LOGOUT = '/logout'; // Login
  static const ME = '/me'; // Login

}
