import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorSchemeSeed: Colors.teal,
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }
}
