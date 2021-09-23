import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductsApi {
  Future<String> addProduct() async {
    String url =
        'https://ecommerc-ef8db-default-rtdb.firebaseio.com/products.json';

    dynamic response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'categories': ['t-shert', 'clothe', 'black'],
        'shortDescription': 'Black T-Shert',
        'description': 'ESSENTIAL BLANKS BOX FIT T-SHIRT JET BLACK ',
        'title': 'jacobe',
        'price': '30',
        'imageUrl':
            'https://images.pexels.com/photos/4321203/pexels-photo-4321203.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
      }),
    );
    if (response.statusCode == 200) {
      return "You Are Logged In Successfully";
    } else {
      return "LogIn Failed Connection Error";
    }
  }

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
}
