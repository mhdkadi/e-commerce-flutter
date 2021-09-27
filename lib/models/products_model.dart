// ignore_for_file: prefer_final_fields

import 'dart:convert';

class ProductsList {
  List _productsList = [];

  ProductsList.productsFromJson(jsonString) {
    json
        .decode(jsonString)
        .map(
          (product) => _productsList.add(
            Product.fromMap(product),
          ),
        )
        .toList();
  }

  List get products => _productsList;
}

class Product {
  Product({
    required this.productId,
    required this.categories,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.shortDescription,
    required this.title,
  });

  final String productId;
  final List<String> categories;
  final String description;
  final String imageUrl;
  final String price;
  final String shortDescription;
  final String title;
  factory Product.fromMap(Map map) => Product.toProduct(map);

  factory Product.toProduct(Map map) => Product(
        productId: map["productId"],
        categories: List<String>.from(map["categories"].map((x) => x)),
        description: map["description"],
        imageUrl: map["imageUrl"],
        price: map["price"],
        shortDescription: map["shortDescription"],
        title: map["title"],
      );
}
