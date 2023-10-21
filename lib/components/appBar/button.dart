import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/store/riverpod_management.dart';

class AppbarButton extends ConsumerWidget {
  const AppbarButton(
      {super.key,
      required this.title,
      this.targetPage,
      required this.icon,
      required this.currentPage});
  final String title;
  final Widget? targetPage;
  final IconData icon;
  final String currentPage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartState = ref.watch(cartProvider);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 60,
          child: IconButton(
            icon: Icon(
              icon,
              color: currentPage == title
                  ? ThemeColors.primary
                  : ThemeColors.textColor,
            ),
            onPressed: () {
              if (targetPage != null) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => targetPage!),
                  (Route<dynamic> route) => false,
                );
              }
            },
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: currentPage == title
                ? ThemeColors.primary
                : ThemeColors.textColor,
          ),
        ),
        Visibility(
          visible: title == 'Cart' && cartState.cart.isNotEmpty,
          child: Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                color: ThemeColors.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: ThemeColors.primary,
                ),
              ),
              child: Center(
                child: Text(
                  cartState.cart.length.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: ThemeColors.white, height: 1),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}




// Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.bottomCenter,
//       children: [
//         SizedBox(
//           height: 60,
//           child: IconButton(
//             icon: Icon(icon,
                // color: currentPage == title
                //     ? ThemeColors.primary
                //     : ThemeColors.textColor),
//             onPressed: () {
//               if (targetPage != null) {
//                 Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (context) => targetPage!),
//                   (Route<dynamic> route) => false,
//                 );
//               }
//             },
//           ),
//         ),
//         Text(
//           title,
//           style: const TextStyle(color: ThemeColors.primary),
//         )
//       ],
//     );