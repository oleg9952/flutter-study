import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';
import '../theme/customThemeData.dart';
import 'themed_text.dart';

class ProductTile extends StatefulWidget {
  final String title;
  final String description;
  final double price;
  final String image;

  const ProductTile({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context).cart;
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: customTheme?.productTileBackgroundColor,
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
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Image.asset(
                        widget.image,
                        height: 150,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  ThemedText(
                      text: widget.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 4),
                  ThemedText(
                    text: widget.description,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 4)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price ---------------------------------------------
                  ThemedText(text: '\$${widget.price.toString()}'),

                  // Add to cart button --------------------------------
                  if (context.read<CartProvider>().isInCart(widget.title))
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ),
                  if (!context.read<CartProvider>().isInCart(widget.title))
                    GestureDetector(
                      onTap: () {
                        context.read<CartProvider>().addToCart(ProductModel(
                            name: widget.title,
                            price: widget.price,
                            description: widget.description,
                            image: widget.image));
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: customTheme?.subTextColor ?? Colors.white,
                              width: 2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.add_outlined,
                          color: customTheme?.textColor,
                        ),
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
