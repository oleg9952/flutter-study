import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isDisabled;

  const Button(
      {super.key,
      required this.onPressed,
      required this.title,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Provider.of<ThemeProvider>(context).theme.colorScheme;

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        title,
        style: TextStyle(color: isDisabled ? Colors.grey : Colors.white),
      ),
    );
  }
}
