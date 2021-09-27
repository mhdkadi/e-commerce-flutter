// ignore_for_file: prefer_final_fields, unused_field
import 'dart:convert';

import 'package:e_commerce_app/data/api_services.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/cupertino.dart';

class ServiceManager with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  String baseURL = 'https://ecommerc-ef8db-default-rtdb.firebaseio.com';
  List _productList = [];
  List _favoriteList = [];
  List _cartList = [];

  void getProducts() async {
    await _apiServices
        .getHttpClient(url: baseURL + '/product' + '.json')
        .then((value) {
      _productList = ProductsList.productsFromJson(value).products;
    });
    notifyListeners();
  }

  void getFavorites(String uid) async {
    await _apiServices
        .getHttpClient(url: baseURL + '/favorite/$uid' + '.json')
        .then((value) {
      _favoriteList = json.decode(value);
    });
    notifyListeners();
  }

  void addToFavoites({required String uid, required String productId}) async {
    List _addFavoriteList = _favoriteList;
    _addFavoriteList.add(productId);
    await _apiServices.putHttpClient(
        url: baseURL + '/favorite/$uid' + '.json',
        body: json.encode(_addFavoriteList));
    _favoriteList = _addFavoriteList;
    notifyListeners();
  }

  void removeFromFavoites(
      {required String uid, required String productId}) async {
    List _addFavoriteList = _favoriteList;
    _addFavoriteList.remove(productId);
    await _apiServices.putHttpClient(
        url: baseURL + '/favorite/$uid' + '.json',
        body: json.encode(_addFavoriteList));
    _favoriteList = _addFavoriteList;
    notifyListeners();
  }

  void addToCart(
      {required String productId,
      required String uid,
      required int anount}) async {
    List _addCartList = _cartList;
    List _product = _addCartList
        .where((element) => element['productId'] == productId)
        .toList();

    _addCartList.removeWhere((element) => element['productId'] == productId);

    if (_product.isNotEmpty) {
      _addCartList.add(
          {'productId': productId, 'amount': _product[0]['amount'] + anount});
    } else {
      _addCartList.add({'productId': productId, 'amount': anount});
    }

    await _apiServices.putHttpClient(
        url: baseURL + '/chart/$uid' + '.json',
        body: json.encode(_addCartList));
  }

  dynamic get productList => _productList;
  dynamic get favoriteList => _favoriteList;
  dynamic get chartList => _cartList;
}
