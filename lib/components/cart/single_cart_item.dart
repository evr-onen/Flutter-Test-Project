import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/store/riverpod_management.dart';

class CartItem extends ConsumerWidget {
  const CartItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartState = ref.watch(cartProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(
          width: 2.0,
          color: ThemeColors.primary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(product.thumbnail!),
            // height: 70,
            width: 70.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120.0,
                child: Text(
                  product.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ThemeColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                product.category!.toUpperCase(),
                style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Condensed'),
              ),
            ],
          ),
          Text(
            "\$${product.price!.toString()}",
            style: const TextStyle(
              fontSize: 12.0,
              color: ThemeColors.textColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'Condensed',
            ),
          ),
          IconButton(
              onPressed: () {
                cartState.deleteCartItem(product, context);
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: ThemeColors.textColor,
              ))
        ],
      ),
    );
  }
}
