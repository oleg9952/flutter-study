import 'package:flutter/material.dart';
import 'package:project_4/shared/layouts/cart_layout.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../router/router.dart';
import '../../shared/theme/customThemeData.dart';
import '../../shared/widgets/product_cart_tile.dart';
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
    final theme = Theme.of(context).extension<CustomThemeData>();
    final cart = Provider.of<CartProvider>(context);

    return CartLayout(title: EnLocale.cart, children: [
      Expanded(
        child: ListView.separated(
          itemCount: cart.cart.length + 1,
          separatorBuilder: (context, _) => const SizedBox(
            height: 10,
            child: Divider(),
          ),
          itemBuilder: (context, index) {
            // Title ------------------------------
            if (index == 0) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ThemedText(
                      text: EnLocale.summary,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            }
            // Products ----------------------------
            return ProductCartTile(product: cart.cart[index - 1]);
          },
        ),
      ),

      // Other widgets ----------------------------
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThemedText(
                  text: EnLocale.totalProducts,
                  style: TextStyle(fontSize: 18),
                ),
                ThemedText(
                  text: 'x${cart.totalItems}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThemedText(
                  text: EnLocale.totalPrice,
                  style: TextStyle(fontSize: 18),
                ),
                ThemedText(
                  text: '\$${cart.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme?.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      title: const Text('✅ Purchase confirmed! ✅'),
                      content: TweenAnimationBuilder(
                        tween: Tween(begin: 3.0, end: 0.0),
                        duration: const Duration(seconds: 3),
                        onEnd: () {
                          if (dialogContext.mounted) {
                            Navigator.pop(dialogContext);
                            context.read<CartProvider>().clearCart();
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              if (context.mounted) {
                                RoutingService.goToMainScreen(context);
                              }
                            });
                          }
                        },
                        builder: (context, value, child) {
                          return Text('Closing in ${value.toInt()} seconds');
                        },
                      ),
                    );
                  },
                );
              },
              child: const Text('Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
    ]);
  }
}
