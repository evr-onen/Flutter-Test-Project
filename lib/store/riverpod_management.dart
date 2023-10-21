import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/store/cart_actions.dart';
import 'package:testproject2/store/product_actions.dart';

final productProvider =
    ChangeNotifierProvider<ProductActions>((ref) => ProductActions());

final productFutureProvider = FutureProvider((ref) async {
  final apiService = ref.read(productProvider);
  return apiService.prepareProducts();
});

final cartProvider =
    ChangeNotifierProvider<CartActions>((ref) => CartActions());
