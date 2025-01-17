import 'package:flutter/material.dart';

import '../../shared/layouts/secondary_layout.dart';
import '../../shared/locale/en.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const SecondaryLayout(title: EnLocale.settings, children: []);
  }
}
