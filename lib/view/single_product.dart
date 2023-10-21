import 'package:flutter/material.dart';
import 'package:testproject2/components/appBar/bottom_nav_bar.dart';
import 'package:testproject2/components/singleProduct/slider.dart';
import 'package:testproject2/components/singleProduct/summary.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          product.title!.toUpperCase(),
          style: const TextStyle(
            color: ThemeColors.white,
            fontFamily: 'Cinzel',
            fontSize: 32.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: ThemeColors.white,
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: ThemeColors.primary,
      ),
      bottomNavigationBar:
          BottomNavBar(product: product, currentPage: "Single Product"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              SliderProduct(
                images: product.images ?? [],
              ),
              Summary(
                product: product,
              )
            ],
          ),
        ),
      ),
    );
  }
}
