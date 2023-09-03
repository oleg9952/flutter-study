import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String screenTitle;
  final Widget? body;

  const MainLayout({super.key, required this.screenTitle, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: body,
    );
  }
}
