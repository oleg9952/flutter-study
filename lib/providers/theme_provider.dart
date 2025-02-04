import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/db_service.dart';
import '../db/models/mode/mode.dart';
import '../theme/theme.dart';

const String isDarkModeKey = 'isDarkModeKey';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = lightMode;

  ThemeData get theme => _theme;
  bool get isDarkMode => _theme == darkMode;

  Future<void> initTheme() async {
    final mode = await DBService.db.modeModels
        .where()
        .keyEqualTo(isDarkModeKey)
        .findFirst();

    if (mode == null) {
      await DBService.db.writeTxn(() => DBService.db.modeModels
          .put(ModeModel(key: isDarkModeKey, value: false)));
      return;
    }

    _theme = mode.value ? darkMode : lightMode;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final mode = isDarkMode ? lightMode : darkMode;

    final dbMode = await DBService.db.modeModels
        .where()
        .keyEqualTo(isDarkModeKey)
        .findFirst();
    dbMode!.value = !isDarkMode;
    await DBService.db.writeTxn(() => DBService.db.modeModels.put(dbMode));

    _theme = mode;
    notifyListeners();
  }
}
