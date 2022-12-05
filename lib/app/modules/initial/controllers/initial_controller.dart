import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template_flutter_web/app/model/menu/menu_model.dart';
import 'package:template_flutter_web/app/modules/dashboard/pages/dashboard_page.dart';

class InitialController extends GetxController {
  InitialController();

  var storage = GetStorage();

  // Variáveis de controle
  final RxList<Widget> _currentsPage = <Widget>[DashboardPage()].obs;
  final _menuSelected = <MenuModel>[].obs;
  final RxBool _userLoggedIn = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _hasError = false.obs;
  final RxString _error = "".obs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  // ------------------------------------------

  // Geters
  bool get isLastPage => _currentsPage.length == 1;

  Widget get getCurrentPage => _currentsPage.value.last;
  int get getCurrentIndex => _currentsPage.value.indexOf(getCurrentPage);
  MenuModel? get getMenuSelected =>
      _menuSelected.isEmpty ? null : _menuSelected.last;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  ScrollController get scrollController => _scrollController;
  bool get userLoggedIn => _userLoggedIn
      .value; // Variável observado em todo o sistema pra saber se o usuário está logado
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;
  String get error => _error.value;
  // ------------------------------------------

  void controlMenu() {
    if (_scaffoldKey.currentState?.isDrawerOpen != null &&
        !_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
    update();
  }

  void setLoading(value) {
    if (value) {
      if (_isLoading.value == false) {
        Future.delayed(Duration.zero, () {
          _isLoading(true);
        });
      }
    } else {
      if (_isLoading.value == true) {
        Future.delayed(Duration.zero, () {
          _isLoading(false);
        });
      }
    }
  }

  void setCurrentPage(Widget view) {
    // if (view is LoginPage) {
    //   backPage();
    //   Get.toNamed(AppRoutes.LOGIN);
    // } else {
    // _currentsPage.add(view);
    _currentsPage.add(view);
    // }
  }

  void setMenuSelected(MenuModel menu) {
    _menuSelected.clear();
    _menuSelected.add(menu);
  }

  void backPage() {
    if (_currentsPage.length > 1) _currentsPage.remove(getCurrentPage);
  }

  void setUserLoggedIn(value) => _userLoggedIn(value);

  void setCleanPages() {
    _currentsPage.clear();
    setCurrentPage(DashboardPage());
  } // Alterar a situação de logado do usuário

  // Future<void> findAll() async {
  //   _isLoading(true);
  //   try {
  //     ResponseAPI dados = await _apiRepository.findAll(BackRoutes.CATEGORY_ALL);
  //     List<Category> ufs =
  //         dados.objeto.map<Category>((e) => Category.fromJson(e)).toList();
  //     _categories.value = ufs;
  //     _hasError(false);
  //     _error("");
  //   } catch (e, s) {
  //     log("Erro ao buscar categorias ", error: e, stackTrace: s);
  //     _hasError(true);
  //     _error("Erro ao buscar categorias");
  //   } finally {
  //     _isLoading(false);
  //   }
  // }
}
