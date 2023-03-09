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

<<<<<<< Updated upstream
  static ColorScheme lightPageScheme = ColorScheme(
    primary: Colors.grey,
    secondary: Colors.black12,
    brightness: Brightness.light,
    onPrimary: Color.fromARGB(179, 0, 0, 0),
    onSecondary: Colors.white70,
=======
    static ColorScheme pageSchemeLight = ColorScheme(
    primary: Colors.white,
    secondary: Colors.black12,
    brightness: Brightness.light,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
>>>>>>> Stashed changes
    error: Colors.red.shade800,
    onError: Colors.white70,
    background: Colors.red,
    onBackground: Colors.white70,
    surface: Colors.black38,
    onSurface: Colors.white70,
  );

<<<<<<< Updated upstream
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      colorScheme: isDarkTheme ? pageScheme : lightPageScheme,
    );
  }

=======
>>>>>>> Stashed changes
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

}