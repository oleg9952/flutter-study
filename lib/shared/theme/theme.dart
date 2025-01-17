import 'package:flutter/material.dart';

import '../layouts/constants.dart';
import 'customThemeData.dart';

final lightTheme = ThemeData(
  extensions: [
    CustomThemeData(
      primaryColor: Color(0xFF36BBF4),
      secondaryColor: Color.fromARGB(255, 122, 208, 245),
      backgroundColor: Colors.white,
      cardBackgroundColor: Colors.grey[300]!,
      topBarTextColor: Colors.white,
      topBarIconColor: Colors.white,
      textColor: Colors.black,
      subTextColor: Colors.grey[600]!,
      horizontalPadding: horizontalPadding,
    ),
  ],
);

final darkTheme = ThemeData(
  extensions: [
    CustomThemeData(
      primaryColor: Color.fromARGB(255, 12, 40, 52),
      secondaryColor: Color(0xFF67A3BF),
      backgroundColor: const Color(0xFF000000),
      cardBackgroundColor: Colors.grey[900]!,
      topBarTextColor: const Color(0xFFFFFFFF),
      topBarIconColor: Colors.white,
      textColor: const Color(0xFFFFFFFF),
      subTextColor: const Color(0xFFFFFFFF),
      horizontalPadding: horizontalPadding,
    ),
  ],
);
