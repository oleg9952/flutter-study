import 'package:flutter/material.dart';

import '../theme/customThemeData.dart';

const tileItemsGap = 12.0;

class ProductTile extends StatelessWidget {
  final String title;
  final String description;
  final double price;

  const ProductTile({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.star_border_outlined,
                        size: 90,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 4),
                  Text(description),
                  SizedBox(height: 4)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${price.toString()}'),
                  GestureDetector(
                    onTap: () {
                      print('add to cart');
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.add_shopping_cart),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
