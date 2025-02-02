import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/router.dart';
import '../../providers/theme_provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Provider.of<ThemeProvider>(context).theme.colorScheme;

    return Drawer(
        backgroundColor: colorScheme.surface,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                  child: Center(
                      child: Icon(
                Icons.edit_document,
                size: 90,
                color: colorScheme.primary,
              ))),

              // nav ------------------------------------------------
              ListTile(
                onTap: () {
                  RoutingService.goToNotesScreen(context);
                  Navigator.pop(context);
                },
                contentPadding:
                    const EdgeInsets.only(top: 0, bottom: 0, left: 10),
                leading: Icon(
                  Icons.note,
                  color: colorScheme.primary,
                ),
                title: Text(
                  'Notes',
                  style: TextStyle(color: colorScheme.inverseSurface),
                ),
              ),
              ListTile(
                onTap: () {
                  RoutingService.goToSettingsScreen(context);
                  Navigator.pop(context);
                },
                contentPadding:
                    const EdgeInsets.only(top: 0, bottom: 0, left: 10),
                leading: Icon(
                  Icons.settings,
                  color: colorScheme.primary,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: colorScheme.inverseSurface),
                ),
              ),
            ],
          ),
        ));
  }
}
