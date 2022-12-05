import 'package:flutter/widgets.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/utils/responsive.dart';

class Utils {
  static List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  //###########
  // Converte a data para formato correto
  // para enviar pro back ou para exibir no sistema
  //###########
  static convertDate(String date) {
    try {
      return date
          .split(new RegExp(r"(/|-)"))
          .reversed
          .join(date.contains("/") ? "-" : "/");
    } catch (e) {
      return "";
    }
  }

  static double widthConteudo(BuildContext context) {
    return Responsive.isDesktop(context)
        ? MediaQuery.of(context).size.width - widthDrawer
        : MediaQuery.of(context).size.width;
  }
}
