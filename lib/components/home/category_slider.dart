import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/view/archive_products.dart';

class CategorySlider extends ConsumerWidget {
  const CategorySlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<Map<String, String>> cats = [
      {
        'name': 'Laptop',
        'image': 'lib/assets/images/cats/laptop.jpeg',
        'type': 'laptops'
      },
      {
        'name': 'Phone',
        'image': 'lib/assets/images/cats/phone.jpg',
        'type': 'smartphones'
      },
      {
        'name': 'Fragrances',
        'image': 'lib/assets/images/cats/parfume.jpeg',
        'type': 'fragrances'
      },
      {
        'name': 'Skincare',
        'image': 'lib/assets/images/cats/parfume.jpeg',
        'type': 'skincare'
      },
      {
        'name': 'Groceries',
        'image': 'lib/assets/images/cats/other.jpeg',
        'type': 'groceries'
      },
      {
        'name': 'Decoration',
        'image': 'lib/assets/images/cats/other.jpeg',
        'type': 'home-decoration'
      },
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: CarouselSlider(
        items: cats
            .map(
              (item) => InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ArchiveProducts(
                              category: item['type']!.toLowerCase(),
                            )),
                  );
                },
                child: Container(
                  height: 150.0,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: ThemeColors.primary,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      color: ThemeColors.primary,
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15.0)),
                        child: Image(
                          image: AssetImage(item['image']!),
                          fit: BoxFit.cover,
                          height: 100.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                        child: Center(
                            child: Text(
                          item['name']!,
                          style: const TextStyle(
                              color: ThemeColors.white,
                              fontFamily: 'Condensed',
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                              letterSpacing: 1.4),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          enlargeCenterPage: false,
          aspectRatio: 16 / 9,
          viewportFraction: 0.33,
          height: 132.0,
        ),
      ),
    );
  }
}
