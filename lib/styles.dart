import 'package:flutter/material.dart';

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

  static AppBarTheme appBarTheme = AppBarTheme(
    foregroundColor: pageScheme.primary,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  static TextStyle headers = TextStyle(
    fontSize: 20,
    color: pageScheme.onPrimary,
  );


}