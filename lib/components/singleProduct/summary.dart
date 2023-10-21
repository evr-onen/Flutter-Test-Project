import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Text(
              product.title!.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: RatingBar.builder(
              initialRating: product.rating!,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: ThemeColors.primary,
              ),
              ignoreGestures: true,
              onRatingUpdate: (rating) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15.0),
            width: double.infinity,
            child: Text("""${product.description!}   
    Velit aliquam arcu accumsan ipsum tincidunt congue. Sed adipiscing mus quis dolor suspendisse vehicula rutrum ultricies a sociosqu at. Inceptos feugiat eget dui posuere amet primis interdum mattis egestas. Odio dis feugiat ipsum vulputate ridiculus orci sapien. Tortor per mus pretium massa hac fames.

Lobortis aptent dis litora nisl vel quisque nulla torquent curae. Dui natoque sagittis nostra ligula dignissim fermentum dictumst proin eleifend porta. Pharetra molestie elit ridiculus est potenti quis venenatis interdum. Tellus sem magnis aliquam cras pulvinar vehicula consectetuer parturient."""),
          ),
        ],
      ),
    );
  }
}
