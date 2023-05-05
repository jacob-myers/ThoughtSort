import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class CustomStyle {

  static ColorScheme pageScheme = ColorScheme(
    primary: Colors.grey,
    secondary: Colors.black12,
    brightness: Brightness.dark,
    onPrimary: Colors.white70,
    onSecondary: Colors.white70,
    error: Colors.red.shade800,
    onError: Colors.white70,
    background: Colors.red,
    onBackground: Colors.white70,
    surface: Colors.black38,
    onSurface: Colors.white70,
  );

    static ColorScheme pageSchemeLight = ColorScheme(
    primary: Colors.white,
    secondary: Colors.black12,
    brightness: Brightness.light,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    error: Colors.red.shade800,
    onError: Colors.white70,
    background: Colors.red,
    onBackground: Colors.white70,
    surface: Colors.black38,
    onSurface: Colors.white70,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    foregroundColor: pageScheme.primary,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

    static AppBarTheme appBarThemeLight = AppBarTheme(
    foregroundColor: pageScheme.primary,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  static TextStyle headers = TextStyle(
    fontSize: 20,
    color: pageScheme.onPrimary,
  );

  static TextStyle cardEditText = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static WindowButtonColors buttonColors = WindowButtonColors(
    iconNormal: const Color (0xFFd8d4c0),
    mouseOver: const Color (0xFF202123),
    iconMouseOver: const Color (0xFF3271cc),
  );

  static WindowButtonColors closeColors = WindowButtonColors(
    iconNormal: const Color (0xFFd8d4c0),
    mouseOver: const Color (0xFF5b4142),
    iconMouseOver: const Color (0xFFf43f00),
  );

  static List<LinearGradient> cardColors = [
    LinearGradient(
        colors: [Color.fromARGB(255, 255, 243, 117), Colors.amber.shade300],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ),
    LinearGradient(
      colors: [Color.fromARGB(255, 193, 255, 106), Color.fromARGB(255, 125, 229, 96)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
        colors: [Color.fromARGB(255, 101, 247, 252), Colors.lightBlue.shade300],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ),
    LinearGradient(
        colors: [Color.fromARGB(255, 255, 222, 77), Color.fromARGB(255, 255, 168, 69)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ),
    LinearGradient(
        colors: [Color.fromARGB(255, 253, 148, 202), Colors.pink.shade300],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ),
    LinearGradient(
        colors: [Color.fromARGB(255, 93, 229, 202), Colors.teal.shade300],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ),
  ];

}