import 'package:e_commerce_app/data/products_api.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsModel with ChangeNotifier {
  final ProductsApi _productsApi = ProductsApi();
  // ignore: prefer_final_fields
  List _productsList = [];
  void getProducts() async {
    if (_productsList.isEmpty) {
      dynamic _products = await _productsApi.getProduct();
      if (_products != []) {
        _products.forEach((key, value) {
          _productsList.add(Product(
              title: value['title'],
              shortDescription: value['shortDescription'],
              description: value['description'],
              id: key,
              price: value['price'],
              categories: value['categories'],
              imageUrl: value['imageUrl']));
        });
      }
    }
  }

  dynamic get productsList => _productsList;
}
