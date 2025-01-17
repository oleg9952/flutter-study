import 'package:flutter/material.dart';

import 'router/router.dart';
import 'shared/theme/theme.dart';

void main() {
  runApp(const MainApp());
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
