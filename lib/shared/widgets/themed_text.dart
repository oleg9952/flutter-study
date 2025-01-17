import 'package:flutter/material.dart';

import '../theme/customThemeData.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const ThemedText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: customTheme?.textColor,
      ).merge(style),
    );
  }
}
