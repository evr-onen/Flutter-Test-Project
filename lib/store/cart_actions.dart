import 'package:flutter/material.dart';
import '../model/product.dart';

class CartActions extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  addToCart(Product product, context) {
    _cart.add(product);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${product.title} has been added to your cart"),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: Colors.black54,
      elevation: 0,
    ));
    notifyListeners();
  }

  deleteCartItem(Product productItem, context) {
    _cart.remove(productItem);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${productItem.title} has been removed from your cart"),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: Colors.black54,
      elevation: 0,
    ));
    notifyListeners();
  }

  deleteAllItems(context) {
    _cart.clear();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("your products are being prepared"),
      duration: Duration(milliseconds: 1500),
      backgroundColor: Colors.black54,
      elevation: 0,
    ));
  }
}
