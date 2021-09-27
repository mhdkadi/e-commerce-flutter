// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> getHttpClient({required String url}) async {
    try {
      dynamic response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        print('getHttpClient succeeded ');
        return response.body;
      } else {
        print(
            'Error From getHttpClient: ${response.body}  statusCode: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error From getHttpClient: $e');
      return false;
    }
  }

  Future<bool> putHttpClient(
      {required String url, required String body}) async {
    try {
      dynamic response = await http.put(
        Uri.parse(url),
        body: body,
      );
      if (response.statusCode == 200) {
        print('putHttpClient succeeded ');
        return true;
      } else {
        print(
            'Error From putHttpClient: ${response.body}  statusCode: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error From putHttpClient: $e');
      return false;
    }
  }
}
