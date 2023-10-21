import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/other/custom_page_route.dart';
import 'package:testproject2/store/riverpod_management.dart';
import 'package:testproject2/view/single_product.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product, this.isSlider = false});
  final Product product;
  final bool? isSlider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartState = ref.watch(cartProvider);
    var deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth / 2,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          width: 1.0,
          color: ThemeColors.primary,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: isSlider!
                ? CarouselSlider(
                    items: product.images!
                        .map(
                          (item) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    CustomPageRoute(
                                      SingleProduct(product: product),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15.0)),
                                  child: Image(
                                    image: NetworkImage(item),
                                    fit: BoxFit.cover,
                                    width: deviceWidth / 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        CustomPageRoute(
                          SingleProduct(product: product),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15.0)),
                      child: Image(
                        image: NetworkImage(product.images![0]),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          CustomPageRoute(
                            SingleProduct(product: product),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: ThemeColors.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: product.rating!,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 12,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: ThemeColors.primary,
                              ),
                              ignoreGestures: true,
                              onRatingUpdate: (rating) {},
                            ),
                            Text(
                              product.title!.toUpperCase(),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: ThemeColors.textColor,
                                  fontFamily: 'Condensed',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                  letterSpacing: 1.4),
                            ),
                            Text(
                              "\$${NumberFormat('#,##0', 'tr_TR').format(product.price)}",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: ThemeColors.textColor,
                                  fontFamily: 'Condensed',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  letterSpacing: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        InkWell(
                          child: Container(
                            height: deviceWidth,
                            width: deviceWidth,
                            decoration: const BoxDecoration(
                              color: ThemeColors.primary,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.0)),
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: ThemeColors.white,
                              size: 24,
                            ),
                          ),
                          onTap: () {
                            cartState.addToCart(product, context);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
