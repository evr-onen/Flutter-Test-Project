import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';

class ProductService {
  String url = "https://dummyjson.com/products/";

  Future<List<Product>> getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      final List result = jsonDecode(response.body)['products'];

      return result.map((e) => Product.fromJson(e)).toList();
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
