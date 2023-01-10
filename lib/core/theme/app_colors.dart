import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(_primaryColorValue),
      100: Color(_primaryColorValue),
      200: Color(_primaryColorValue),
      300: Color(_primaryColorValue),
      400: Color(_primaryColorValue),
      500: Color(_primaryColorValue),
      600: Color(_primaryColorValue),
      700: Color(_primaryColorValue),
      800: Color(_primaryColorValue),
      900: Color(_primaryColorValue),
    },
  );
  static const int _primaryColorValue = 0XFF9239C9;

  static const Color backgroundColor = Color(0XFF11011C);
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color blackColor = Color(0XFF000000);
  static const Color grayColor = Color(0XFF897A93);
  static const Color redColor = Color(0XFFFF0000);
  static const Color inputBackgroundColor = Color(0XFF261B2F);
  static const Color borderColor = Color(0XFF1E1126);
  static const Color modalBackgroundColor = Color(0XFF210534);
  static const Color modalCloseButtonColor = Color(0XFF402159);
}