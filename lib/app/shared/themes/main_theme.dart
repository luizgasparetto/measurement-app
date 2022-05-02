import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(192, 222, 221, 1),
      primaryColorDark: const Color.fromRGBO(24, 24, 24, 1),
      fontFamily: 'Lato',
    );
  }
}
