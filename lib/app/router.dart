import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/category/category_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String category = '/category';
  static const String profile = '/profile';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case AppRoutes.category:
        final args = settings.arguments as CategoryScreenArgs?;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(args: args),
          settings: settings,
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
          settings: settings,
        );
    }
  }
}
