import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/store/riverpod_management.dart';
import 'package:testproject2/view/home.dart';

class CartPageExtraBottomExtraBar extends ConsumerWidget {
  const CartPageExtraBottomExtraBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartState = ref.watch(cartProvider);
    int totalPrice = 0;
    for (var element in cartState.cart) {
      totalPrice += element.price!.toInt();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      height: 75.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  const Text(
                    'Subtotal ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "\$ ${NumberFormat('#,##0.00', 'tr_TR').format(totalPrice)}",
                  ),
                ],
              ),
              Wrap(
                spacing: 11.5,
                runSpacing: 10.0,
                children: <Widget>[
                  const Text(
                    '%18 Tax ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                      "\$ ${NumberFormat('#,##0.00', 'tr_TR').format(totalPrice * 0.18)}"),
                ],
              ),
              Wrap(
                spacing: 22.5,
                runSpacing: 10.0,
                children: <Widget>[
                  const Text(
                    'TOTAL ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "\$ ${NumberFormat('#,##0.00', 'tr_TR').format(totalPrice * 1.18)}",
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          )),
          SizedBox(
            child: ElevatedButton(
              onPressed: cartState.cart.isEmpty
                  ? null
                  : () {
                      cartState.deleteAllItems(context);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false,
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColors.primary,
              ),
              child: const Text(
                'Proceed',
                style: TextStyle(color: ThemeColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
