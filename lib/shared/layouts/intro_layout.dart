import 'package:flutter/material.dart';

import '../theme/customThemeData.dart';
import 'constants.dart';

class IntroLayout extends StatelessWidget {
  final List<Widget> children;

  const IntroLayout({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomThemeData>()?.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Theme.of(context)
                    .extension<CustomThemeData>()
                    ?.horizontalPadding ??
                horizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
