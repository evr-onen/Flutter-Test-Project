import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/components/appBar/bottom_nav_bar.dart';
import 'package:testproject2/components/cart/single_cart_item.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/store/riverpod_management.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartState = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(
            color: ThemeColors.white,
            fontFamily: 'Cinzel',
            fontSize: 32.0,
          ),
        ),
        elevation: 0,
        backgroundColor: ThemeColors.primary,
      ),
      bottomNavigationBar: const BottomNavBar(currentPage: "Cart"),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 200,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Builder(
            builder: (context) {
              if (cartState.cart.isEmpty) {
                return const Center(
                    heightFactor: 20,
                    child: Text('There is no Product in your Cart'));
              } else {
                return Column(
                  children: [
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: cartState.cart.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product cartProduct = cartState.cart[index];
                        return CartItem(product: cartProduct);
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
