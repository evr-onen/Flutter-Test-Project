import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/components/global/product_card.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/store/riverpod_management.dart';

class PopularProducts extends ConsumerWidget {
  const PopularProducts({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(productFutureProvider);
    List<Product> products = ref.watch(productProvider).allProducts;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: deviceWidth,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            width: deviceWidth,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: ThemeColors.textColor),
            ),
          ),
          CarouselSlider(
            items: products.map((item) => ProductCard(product: item)).toList(),
            options: CarouselOptions(
              disableCenter: true,
              enlargeCenterPage: false,
              aspectRatio: 16 / 9,
              viewportFraction: 0.5,
              height: 238,
            ),
          ),
        ],
      ),
    );
  }
}
