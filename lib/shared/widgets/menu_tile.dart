import 'package:flutter/material.dart';

import '../theme/customThemeData.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    return ListTile(
      leading: Icon(
        icon,
        color: customTheme?.primaryColor,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: customTheme?.textColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
