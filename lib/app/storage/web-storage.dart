import 'dart:html' show window;

class WebStorage {
  //Singleton
  WebStorage._internal();
  static final WebStorage instance = WebStorage._internal();
  factory WebStorage() {
    return instance;
  }

  // Token
  String? get token => window.localStorage['token'];
  void setToken(String? token) => (token == null)
      ? window.localStorage.remove('token')
      : window.localStorage['token'] = token;
}
