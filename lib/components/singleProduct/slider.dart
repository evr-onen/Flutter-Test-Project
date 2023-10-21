import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderProduct extends StatelessWidget {
  const SliderProduct({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        items: images
            .map(
              (item) => Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15.0)),
                  child: Image(
                    image: NetworkImage(item),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
            enlargeCenterPage: false,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            height: 400.0),
      ),
    );
  }
}
