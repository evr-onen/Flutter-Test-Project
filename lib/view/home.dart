import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/components/appBar/bottom_nav_bar.dart';
import 'package:testproject2/components/home/banner.dart';
import 'package:testproject2/components/home/category_slider.dart';
import 'package:testproject2/components/home/popular_products.dart';
import 'package:testproject2/other/colors.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Logo",
          style: TextStyle(
            color: ThemeColors.white,
            fontFamily: 'Cinzel',
            fontSize: 32.0,
          ),
        ),
        elevation: 0,
        backgroundColor: ThemeColors.primary,
      ),
      bottomNavigationBar: const BottomNavBar(currentPage: 'Home'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: const Column(
            children: [
              HomeBanner(),
              CategorySlider(),
              PopularProducts(title: 'Popular Products'),
              PopularProducts(title: 'Top Sales Products'),
            ],
          ),
        ),
      ),
    );
  }
}
