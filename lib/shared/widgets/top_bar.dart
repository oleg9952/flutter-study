import 'dart:ui';

import 'package:flutter/material.dart';

import '../../router/router.dart';
import '../theme/customThemeData.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSecondary;

  const TopBarWidget({
    super.key,
    required this.title,
    this.isSecondary = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: customTheme?.topBarTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (!isSecondary)
          IconButton(
            onPressed: () => RoutingService.goToSettingsScreen(context),
            icon: Icon(
              Icons.settings,
              color: customTheme?.topBarIconColor,
            ),
          ),
      ],
      iconTheme: IconThemeData(color: customTheme?.topBarIconColor),
      backgroundColor: customTheme?.primaryColor,
    );
  }
}
