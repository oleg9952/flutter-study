import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        inverseSurface: Colors.black,
        primary: Colors.deepPurple,
        secondary: Colors.white));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade900,
        inverseSurface: Colors.white,
        primary: Colors.deepPurple,
        secondary: Colors.black));
