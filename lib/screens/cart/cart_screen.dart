import 'package:flutter/material.dart';

import '../../shared/layouts/secondary_layout.dart';
import '../../shared/locale/en.dart';
import '../../shared/widgets/themed_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SecondaryLayout(title: EnLocale.cart, children: [
      ThemedText(
        text: 'item 1',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      ThemedText(text: 'item 2'),
      SizedBox(height: 10),
      ThemedText(text: 'item 3'),
    ]);
  }
}
