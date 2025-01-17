import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/intro/intro_screen.dart';
import '../screens/main/main_screen.dart';
import '../screens/product/product_screen.dart';
import '../screens/settings/settings_screen.dart';

class RouterPaths {
  static const intro = '/';
  static const main = '/main';
  static const cart = '/cart';
  static const product = '/product/:productId';
  static const settings = '/settings';
}

class RoutingService {
  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: RouterPaths.intro,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: RouterPaths.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: RouterPaths.cart,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: RouterPaths.product,
        builder: (context, state) => const ProductScreen(),
      ),
      GoRoute(
        path: RouterPaths.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );

  // navigation methods --------------------------------------------------------

  static void goToIntroScreen(BuildContext context) {
    GoRouter.of(context).go(RouterPaths.intro);
  }

  static void goToMainScreen(BuildContext context) {
    GoRouter.of(context).go(RouterPaths.main);
  }

  static void goToCartScreen(BuildContext context) {
    GoRouter.of(context).push(RouterPaths.cart);
  }

  static void goToProductScreen(BuildContext context, String productId) {
    final productIdKey = RouterPaths.product.split('/').last;
    GoRouter.of(context)
        .push(RouterPaths.product.replaceFirst(productIdKey, productId));
  }

  static void goToSettingsScreen(BuildContext context) {
    GoRouter.of(context).push(RouterPaths.settings);
  }
}
