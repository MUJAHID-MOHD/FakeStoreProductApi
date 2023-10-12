import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var productsJson = json.decode(response.body);
      products.value = (productsJson as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    }
  }
}
