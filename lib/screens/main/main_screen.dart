import 'package:flutter/material.dart';

import '../../shared/layouts/main_layout.dart';
import '../../shared/locale/en.dart';
import '../../shared/widgets/themed_text.dart';
import '../../shared/widgets/product_tile.dart';
import '../../mocks/products_mock.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: EnLocale.shop,
      children: [
        // Title ----------------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ThemedText(
            text: 'List of products',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),

        // List of products ----------------------------
        SizedBox(
          height: 450,
          child: ListView.separated(
              itemCount: productsMock.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final product = productsMock[index];
                return ProductTile(
                  title: product.name,
                  description: product.description,
                  price: product.price,
                  image: product.image,
                );
              }),
        ),

        // Other widgets ----------------------------
      ],
    );
  }
}
