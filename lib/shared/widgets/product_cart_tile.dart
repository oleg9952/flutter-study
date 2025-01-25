import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_4/models/product_model.dart';
import 'package:project_4/shared/widgets/themed_text.dart';

import '../../providers/cart_provider.dart';

class ProductCartTile extends StatelessWidget {
  final ProductModel product;

  const ProductCartTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          // Image section --------------------------------
          SizedBox(
            width: 90,
            child: Image.asset(product.image),
          ),

          // Text section --------------------------------
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ThemedText(
                  text: product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                ThemedText(
                  text: '\$${product.price.toString()}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[300],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),

          // Remove button --------------------------------
          IconButton(
            onPressed: () {
              context.read<CartProvider>().removeFormCart(product.name);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.blue[300],
            ),
          )
        ],
      ),
    );
  }
}
