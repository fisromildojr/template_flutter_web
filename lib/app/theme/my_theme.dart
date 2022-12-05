import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class MyThemes {
  static final darkTheme = ThemeData.dark().copyWith();

  static final lightTheme = ThemeData.light().copyWith(
    primaryColorLight: MyColors.primaryLight,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: MyColors.primaryLight,
    ),
    primaryIconTheme: const IconThemeData(
      color: MyColors.primaryLight,
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
      visualDensity: VisualDensity(),
      contentPadding: EdgeInsets.only(
        left: defaultPadding,
      ),
      style: ListTileStyle.list,
      textColor: MyColors.textLight,
      iconColor: MyColors.textLight,
      selectedColor: MyColors.primaryLight,
      selectedTileColor: MyColors.menuSelectedLight,
      mouseCursor: MaterialStateMouseCursor.clickable,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          // bottomRight: Radius.circular(5),
          // bottomLeft: Radius.circular(5),
        ),
      ),
      // tileColor: MyColors.primaryLight,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      // Botão Cancelar
      style: ButtonStyle(
        mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
        textStyle:
            MaterialStateProperty.all(const TextStyle(color: MyColors.error)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: MyColors.primaryLight,
          fontWeight: FontWeight.bold,
        ),
      ),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        mouseCursor: MaterialStateProperty.all(MouseCursor.uncontrolled),
        textStyle:
            MaterialStateProperty.all(const TextStyle(color: MyColors.white)),
        backgroundColor: MaterialStateProperty.all(MyColors.primaryDark),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: MyColors.bgColorScreenLight,
      hintStyle: const TextStyle(
        color: MyColors.textDark,
        fontSize: fontSizeInputs,
      ),
      focusColor: MyColors.error,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: MyColors.error,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      counterStyle: const TextStyle(fontSize: fontSizeInputs),
      contentPadding: const EdgeInsets.all(contentPaddingTF),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: MyColors.border,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: MyColors.primaryLight,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
    ),
    primaryColor: MyColors.primaryLight,
    tooltipTheme: null,
    scaffoldBackgroundColor: MyColors.bgColorScreenLight,
    drawerTheme: const DrawerThemeData(
      backgroundColor: MyColors.white,
      scrimColor: null,
      elevation: null,
      shape: null,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: fontSizeInputs,
        color: MyColors.textLight,
        overflow: TextOverflow.ellipsis,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: MyColors.textLight,
        overflow: TextOverflow.ellipsis,
      ),
      headline6: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: MyColors.textLight,
      ),
    ),
    iconTheme: const IconThemeData(
      color: MyColors.textLight,
      size: 20.0,
    ),
  );
}
