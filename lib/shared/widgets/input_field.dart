import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isMultiLine;
  final String? hintText;

  const InputField({
    super.key,
    required this.controller,
    this.hintText,
    this.isMultiLine = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<ThemeProvider>().theme.colorScheme;

    return TextField(
      controller: controller,
      maxLines: isMultiLine ? 4 : null,
      style: TextStyle(color: colorScheme.inverseSurface),
      decoration: InputDecoration(
          hintText: hintText, hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
