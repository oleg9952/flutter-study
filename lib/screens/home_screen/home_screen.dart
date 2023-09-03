import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/routes.dart';
import 'package:flutter_application_1/shared/widgets/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      screenTitle: 'Home',
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          navButton(
              context: context,
              title: 'Go to Cars',
              onPressed: () => Navigator.pushNamed(context, Routes.cars)),
        ]),
      ),
    );
  }

  SizedBox navButton(
      {required BuildContext context,
      required String title,
      required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
