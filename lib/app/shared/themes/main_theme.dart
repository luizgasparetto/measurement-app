import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(192, 222, 221, 1),
      primaryColorDark: const Color.fromRGBO(23, 24, 31, 1),
      dialogBackgroundColor: const Color.fromARGB(255, 93, 93, 101),
      fontFamily: 'Roboto',
    );
  }
}
