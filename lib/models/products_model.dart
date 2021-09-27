// ignore_for_file: prefer_final_fields

import 'dart:convert';

class ProductsList {
  List _productsList = [];

  ProductsList.productsFromJson(jsonString) {
    json
        .decode(jsonString)
        .map(
          (product) => _productsList.add(
            Product.fromlist(product),
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
  factory Product.fromlist(Map str) => Product.toProduct(str);

  factory Product.toProduct(list) => Product(
        productId: list["productId"],
        categories: List<String>.from(list["categories"].map((x) => x)),
        description: list["description"],
        imageUrl: list["imageUrl"],
        price: list["price"],
        shortDescription: list["shortDescription"],
        title: list["title"],
      );
}
