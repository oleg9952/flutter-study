import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../router/router.dart';
import '../theme/customThemeData.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSecondary;

  const TopBarWidget({
    super.key,
    required this.title,
    this.isSecondary = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final customTheme = Theme.of(context).extension<CustomThemeData>();

    final isCartEmpty = cart.totalItems == 0;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: customTheme?.topBarTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (!isSecondary)
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  if (!isCartEmpty) RoutingService.goToCartScreen(context);
                },
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: isCartEmpty
                      ? const Color(0xFFD8D8D8)
                      : customTheme?.topBarIconColor,
                ),
              ),
              if (!isCartEmpty)
                Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(cart.totalItems.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 10),
                          textAlign: TextAlign.center),
                    ))
            ],
          ),
      ],
      iconTheme: IconThemeData(color: customTheme?.topBarIconColor),
      backgroundColor: customTheme?.primaryColor,
    );
  }
}
