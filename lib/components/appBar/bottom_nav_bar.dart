import 'package:flutter/material.dart';
import 'package:testproject2/components/appBar/button.dart';
import 'package:testproject2/components/cart/bottom_extra_bar.dart';
import 'package:testproject2/components/singleProduct/bottom_extra_bar.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/view/archive_products.dart';
import 'package:testproject2/view/cart.dart';
import 'package:testproject2/view/home.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.product, required this.currentPage});
  final Product? product;
  final String currentPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: product != null || currentPage == "Cart" ? 150.0 : 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: [
          if (product != null) SingleProductBottomExtraBar(product: product!),
          if (currentPage == "Cart") const CartPageExtraBottomExtraBar(),
          Container(
            color: ThemeColors.background,
            height: 75.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppbarButton(
                  title: 'Home',
                  currentPage:
                      currentPage == "Single Product" ? "Home" : currentPage,
                  icon: Icons.home,
                  targetPage: const HomePage(),
                ),
                AppbarButton(
                  title: 'Cart',
                  currentPage:
                      currentPage == "Single Product" ? "Home" : currentPage,
                  icon: Icons.shopping_cart,
                  targetPage: const CartPage(),
                ),
                AppbarButton(
                  title: 'Products',
                  currentPage:
                      currentPage == "Single Product" ? "Home" : currentPage,
                  icon: Icons.list,
                  targetPage: ArchiveProducts(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
