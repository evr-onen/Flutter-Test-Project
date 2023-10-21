import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject2/components/appBar/bottom_nav_bar.dart';
import 'package:testproject2/components/global/product_card.dart';
import 'package:testproject2/model/product.dart';
import 'package:testproject2/other/colors.dart';
import 'package:testproject2/store/riverpod_management.dart';

class ArchiveProducts extends ConsumerWidget {
  ArchiveProducts({super.key, this.category});
  final TextEditingController searchController = TextEditingController();
  final String? category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productState = ref.watch(productProvider);
    productState.setCatName(category ?? '');

    List<Product> products = productState.filteredProducts;
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          category != null ? category! : "Products",
          style: const TextStyle(
            color: ThemeColors.white,
            fontFamily: 'Cinzel',
            fontSize: 32.0,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              color: ThemeColors.white,
              onPressed: () {
                showOverlay(context, ref);
              },
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: ThemeColors.primary,
      ),
      bottomNavigationBar: const BottomNavBar(currentPage: 'Products'),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(productFutureProvider.future),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 233,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20.0),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  isSlider: true,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context, WidgetRef ref) {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;
    var productState = ref.watch(productProvider);

    final TextEditingController textController = TextEditingController();
    // if (category == null && textController.text.isEmpty) {
    //   productState.resetCategoryFilter();
    // }
    final FocusNode focusNode = FocusNode();
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Column(
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Material(
              child: Container(
                color: ThemeColors.primary,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: TextField(
                        controller: textController,
                        focusNode: focusNode,
                        onChanged: (text) {
                          productState.searchFilterProducts(text);
                        },
                        onSubmitted: (text) {
                          overlayEntry!.remove();
                        },
                      ),
                    ),
                    Positioned(
                      right: 5,
                      child: IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        color: ThemeColors.white,
                        onPressed: () {
                          overlayEntry!.remove();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

    overlayState.insert(overlayEntry);
    focusNode.requestFocus();
  }
}
