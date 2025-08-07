import 'package:flutter/material.dart';

class CategoryScreenArgs {
  final String categoryId;
  const CategoryScreenArgs({required this.categoryId});
}

class CategoryScreen extends StatelessWidget {
  final CategoryScreenArgs? args;
  const CategoryScreen({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final id = args?.categoryId ?? '-';
    return Scaffold(
      appBar: AppBar(title: const Text('Category')),
      body: Center(child: Text('Category Screen Placeholder (id: $id)')),
    );
  }
}
