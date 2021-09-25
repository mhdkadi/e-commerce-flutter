// ignore_for_file: prefer_final_fields

import 'package:e_commerce_app/data/products_api.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductsModel with ChangeNotifier {
  final ProductsApi _productsApi = ProductsApi();

  List _productsList = [];
  List _favorite = [];
  void getProducts() async {
    if (_productsList.isEmpty) {
      dynamic _products = await _productsApi.getProduct();
      if (_products != []) {
        _products.forEach((key, value) {
          _productsList.add(
            Product(
              title: value['title'],
              shortDescription: value['shortDescription'],
              description: value['description'],
              id: key,
              price: value['price'],
              categories: value['categories'],
              imageUrl: value['imageUrl'],
            ),
          );
        });
      }
    }
    notifyListeners();
  }

  void getFavorite(String uid) async {
    await _productsApi.getFavoite(userId: uid).then((value) {
      if (value != null) {
        _favorite = value;
      }
      notifyListeners();
    });
  }

  Future<String> addFavorite(
      {required String productId, required String uid}) async {
    List _addFavoriteList = _favorite;
    _addFavoriteList.add(productId);

    dynamic _response = await _productsApi.addToFavoite(
        userId: uid, products: _addFavoriteList);
    if (_response == 'succeeded') {
      notifyListeners();
      return 'succeeded';
    } else {
      return 'failed';
    }
  }

  Future<String> removeFavorite(
      {required String productId, required String uid}) async {
    List _removeFavoriteList = _favorite;
    _removeFavoriteList.remove(productId);

    dynamic _response = await _productsApi.removeFavoite(
        userId: uid, products: _removeFavoriteList);
    if (_response == 'succeeded') {
      notifyListeners();
      return 'succeeded';
    } else {
      return 'failed';
    }
  }

  dynamic get productsList => _productsList;
  dynamic get favoritesList => _favorite;
}
