import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/notes.dart';
import '../screens/settings.dart';

class RouterPaths {
  static const notes = '/';
  static const settings = '/settings';
}

class RoutingService {
  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: RouterPaths.notes,
        builder: (context, state) => const NotesScreen(),
      ),
      GoRoute(
        path: RouterPaths.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );

  // navigation methods --------------------------------------------------------

  static void goToNotesScreen(BuildContext context) {
    GoRouter.of(context).go(RouterPaths.notes);
  }

  static void goToSettingsScreen(BuildContext context) {
    GoRouter.of(context).go(RouterPaths.settings);
  }
}
