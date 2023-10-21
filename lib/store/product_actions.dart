import 'package:flutter/material.dart';

import '../model/product.dart';
import '../service/product.dart';

class ProductActions extends ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _catProducts = [];
  List<Product> _filteredProducts = [];
  String _catName = '';

  List<Product> get allProducts => _allProducts;
  List<Product> get filteredProducts => _filteredProducts;

  prepareProducts() async {
    var response = await ProductService().getData();
    _allProducts = response.toList();
    _filteredProducts = response.toList();
    if (_catName.isNotEmpty) {
      List<Product> tmpList = _allProducts.where((product) {
        return product.category!.toLowerCase() == _catName;
      }).toList();
      _catProducts = tmpList;
      _filteredProducts = tmpList;
    }
    notifyListeners();
  }

  setCatName(String cat) {
    if (_catName != cat) {
      _catName = cat;
      if (_catName.isEmpty) {
        _catProducts.clear();
        _filteredProducts = _allProducts;
      } else {
        List<Product> tmpList = _allProducts.where((product) {
          return product.category!.toLowerCase() == cat;
        }).toList();

        _catProducts = tmpList;
        _filteredProducts = tmpList;
      }
    }
  }

  searchFilterProducts(String text) {
    List<Product> tmpListProducts = [];

    if (text.isNotEmpty) {
      if (_catName.isNotEmpty) {
        tmpListProducts = _catProducts
            .where((item) =>
                item.title!.toLowerCase().contains(text.toLowerCase()))
            .toList();
      } else {
        tmpListProducts = _allProducts
            .where((item) =>
                item.title!.toLowerCase().contains(text.toLowerCase()))
            .toList();
      }
    } else {
      if (_catProducts.isNotEmpty) {
        tmpListProducts = _catProducts;
      } else {
        tmpListProducts = _allProducts;
      }
    }
    _filteredProducts = tmpListProducts;
    notifyListeners();
  }
}
