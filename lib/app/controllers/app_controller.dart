import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/models/product_model.dart';

class AppController extends GetxController {
  var products = <Product>[].obs;

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));

    var serverResponse = [
      Product(1, "Demo Product", "aby",
          "This is a Product that we are going to show by getX", 300.0),
      Product(2, "Demo Product", "aby",
          "This is a Product that we are going to show by getX", 300.0),
      Product(3, "Demo Product", "aby",
          "This is a Product that we are going to show by getX", 300.0),
      Product(4, "Demo Product", "aby",
          "This is a Product that we are going to show by getX", 300.0),
      Product(5, "Demo Product", "aby",
          "This is a Product that we are going to show by getX", 300.0),
      Product(6, "Demo Product", "aby",
          "This is a Product that we are going to show by getX", 300.0),
    ];
    products.value = serverResponse;
    return serverResponse;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
