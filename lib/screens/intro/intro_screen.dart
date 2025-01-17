import 'package:flutter/material.dart';
import 'package:project_4/router/router.dart';

import '../../shared/layouts/intro_layout.dart';
import '../../shared/locale/en.dart';
import '../../shared/widgets/themed_text.dart';
import '../../shared/theme/customThemeData.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    return IntroLayout(children: [
      Center(
        child: Icon(
          Icons.shopping_cart_rounded,
          size: 100,
          color: customTheme?.secondaryColor,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      Center(
        child: ThemedText(
          text: EnLocale.minimalShop,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 16),
      Center(
        child: ThemedText(
          text: EnLocale.madeWithFlutter,
          style: TextStyle(
            fontSize: 16,
            color: customTheme?.subTextColor,
          ),
        ),
      ),
      const SizedBox(height: 16),
      Center(
        child: IconButton(
          onPressed: () {
            RoutingService.goToMainScreen(context);
          },
          icon: Icon(
            Icons.arrow_forward_sharp,
          ),
          iconSize: 50,
          style: IconButton.styleFrom(
            backgroundColor: customTheme?.primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      )
    ]);
  }
}
