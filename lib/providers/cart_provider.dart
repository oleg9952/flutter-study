import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _cart = [];

  List<ProductModel> get cart => _cart;

  double get totalPrice => _cart.fold(0, (sum, product) => sum + product.price);

  int get totalItems => _cart.length;

  void addToCart(ProductModel product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFormCart(String productName) {
    cart.removeWhere((product) => product.name == productName);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  bool isInCart(String productName) =>
      _cart.any((product) => product.name == productName);
}
