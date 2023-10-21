import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/store/riverpod_management.dart';

class SingleProductBottomExtraBar extends ConsumerWidget {
  const SingleProductBottomExtraBar({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartState = ref.watch(cartProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 75.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.turned_in_rounded,
                    size: 66,
                    color: ThemeColors.primary,
                  ),
                  Builder(
                    builder: (context) {
                      if (product.discountPercentage != null) {
                        return Text(
                          "% ${product.discountPercentage!.toInt().toString()} ",
                          style: const TextStyle(
                              color: ThemeColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$ ${product.price!.toDouble().toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "\$ ${(product.price! / 100 * (100 + product.discountPercentage!.toInt())).toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: ThemeColors.textColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              )
            ]),
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                cartState.addToCart(product, context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    ThemeColors.primary, // Arka plan rengi burada belirtiliyor
              ),
              child: const Text(
                'Add To Cart',
                style: TextStyle(color: ThemeColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
