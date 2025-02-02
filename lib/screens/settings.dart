import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/widgets/main_drawer.dart';
import '../shared/widgets/section.dart';
import '../shared/widgets/setting_tile.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeProvider>(context);
    final colorScheme = appTheme.theme.colorScheme;

    return Scaffold(
        backgroundColor: colorScheme.surface,
        drawer: const MainDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: colorScheme.inverseSurface),
          backgroundColor: colorScheme.surface,
          title: Text(
            'Settings',
            style: TextStyle(color: colorScheme.inverseSurface),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 20),
            child: Column(
              children: [
                Section(children: [
                  SettingTile(
                      leadingIcon: Icons.dark_mode,
                      title: 'Dark Mode',
                      subtitle: 'Enables dark mode for the app.',
                      value: appTheme.isDarkMode,
                      onSwitchTap: (val) {
                        appTheme.toggleTheme();
                      }),
                ]),
              ],
            ),
          ),
        ));
  }
}
