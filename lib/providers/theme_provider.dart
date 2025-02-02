import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = lightMode;

  ThemeData get theme => _theme;
  bool get isDarkMode => _theme == darkMode;

  void toggleTheme() {
    final mode = isDarkMode ? lightMode : darkMode;
    _theme = mode;
    notifyListeners();
  }
}
