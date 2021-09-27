import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductsApi {
  Future<dynamic> getProduct() async {
    try {
      String url =
          'https://ecommerc-ef8db-default-rtdb.firebaseio.com/products.json';

      dynamic response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
      return [];
    }
  }

  Future<String> addToFavoite(
      {required List products, required String userId}) async {
    String url =
        'https://ecommerc-ef8db-default-rtdb.firebaseio.com/favorite/$userId.json';
    try {
      dynamic response = await http.put(
        Uri.parse(url),
        body: json.encode(products),
      );

      if (response.statusCode == 200) {
        return 'succeeded';
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  Future<String> removeFavoite(
      {required List products, required String userId}) async {
    String url =
        'https://ecommerc-ef8db-default-rtdb.firebaseio.com/favorite/$userId.json';
    try {
      dynamic response = await http.put(
        Uri.parse(url),
        body: json.encode(products),
      );

      if (response.statusCode == 200) {
        return 'succeeded';
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  Future<dynamic> getFavoite({required String userId}) async {
    String url =
        'https://ecommerc-ef8db-default-rtdb.firebaseio.com/favorite/$userId.json';
    try {
      dynamic response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<String> removeChart(
      {required List products, required String userId}) async {
    String url =
        'https://ecommerc-ef8db-default-rtdb.firebaseio.com/chart/$userId.json';
    try {
      dynamic response = await http.put(
        Uri.parse(url),
        body: json.encode(products),
      );

      if (response.statusCode == 200) {
        return 'succeeded';
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  Future<dynamic> getChart({required String userId}) async {
    String url =
        'https://ecommerc-ef8db-default-rtdb.firebaseio.com/chart/$userId.json';
    try {
      dynamic response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<String> addToChart(
      {required List products, required String userId}) async {
    String url =
        'https://ecommerc-ef8db-default-rtdb.firebaseio.com/chart/$userId.json';
    try {
      dynamic response = await http.put(
        Uri.parse(url),
        body: json.encode(products),
      );

      if (response.statusCode == 200) {
        return 'succeeded';
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }
}
