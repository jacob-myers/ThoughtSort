import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:thought_sort/themepreference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    ThemePreference.saveThemePreference(value);
    notifyListeners();
  }
}