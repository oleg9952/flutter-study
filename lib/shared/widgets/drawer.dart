import 'package:flutter/material.dart';
import 'package:project_4/router/router.dart';

import '../locale/en.dart';
import '../theme/customThemeData.dart';
import 'menu_tile.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    return Drawer(
      backgroundColor: customTheme?.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // HEADER ------------------------------------------------------------
              DrawerHeader(
                decoration: BoxDecoration(color: customTheme?.primaryColor),
                padding: EdgeInsets.zero,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: 100,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // MENU ------------------------------------------------------------
              MenuTile(
                title: EnLocale.shop,
                icon: Icons.home,
                onTap: () {
                  Navigator.of(context).pop();
                  RoutingService.goToMainScreen(context);
                },
              ),
              MenuTile(
                title: EnLocale.cart,
                icon: Icons.shopping_cart_rounded,
                onTap: () {
                  Navigator.of(context).pop();
                  RoutingService.goToCartScreen(context);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MenuTile(
              title: EnLocale.exit,
              icon: Icons.exit_to_app,
              onTap: () {
                Navigator.of(context).pop();
                RoutingService.goToIntroScreen(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
