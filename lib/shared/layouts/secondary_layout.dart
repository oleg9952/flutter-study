import 'package:flutter/material.dart';

import '../theme/customThemeData.dart';
import '../widgets/top_bar.dart';
import "constants.dart";

class SecondaryLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SecondaryLayout(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomThemeData>()?.backgroundColor,
      appBar: TopBarWidget(title: title, isSecondary: true),
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
            children: children,
          ),
        ),
      ),
    );
  }
}
