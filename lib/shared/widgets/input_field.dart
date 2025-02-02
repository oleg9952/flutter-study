import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const InputField({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<ThemeProvider>().theme.colorScheme;

    return TextField(
      controller: controller,
      style: TextStyle(color: colorScheme.inverseSurface),
      decoration: InputDecoration(
          hintText: hintText, hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
