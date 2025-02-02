import 'package:flutter/material.dart';
import 'package:notes_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String? subtitle;
  final bool value;

  final void Function(bool) onSwitchTap;

  const SettingTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onSwitchTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Provider.of<ThemeProvider>(context).theme.colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Icon(
        leadingIcon,
        size: 35,
        color: colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: colorScheme.inverseSurface),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(color: colorScheme.inverseSurface),
            )
          : null,
      trailing: Switch(value: value, onChanged: onSwitchTap),
    );
  }
}
