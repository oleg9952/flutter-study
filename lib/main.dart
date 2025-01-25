import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router/router.dart';
import 'shared/theme/theme.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutingService.routes,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
