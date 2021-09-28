// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices with ChangeNotifier {
  String? _token;
  String? _refreshToken;
  DateTime? _expiryDate;
  String? _userId;
  String _email = '';
  String _password = '';
  String _conformPassword = '';
  void changeEmail({required String email}) {
    _email = email;
    notifyListeners();
  }

  void changePassword({required String password}) {
    _password = password;
    print(_password);
    notifyListeners();
  }

  void changeConformPassword({required String conformPassword}) {
    _conformPassword = conformPassword;
    print(_conformPassword);
    notifyListeners();
  }

  String get email => _email;
  String get uid => "$_userId";

  String get password => _password;
  String get cnformPassword => _conformPassword;

  void notify() {
    notifyListeners();
  }

  Future<void> getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
      final extractedUserData =
          json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
      final expiryDate =
          DateTime.parse(extractedUserData['expiryDate'].toString());
      _token = extractedUserData['token'].toString();
      _refreshToken = extractedUserData['refresh_token'].toString();
      _userId = extractedUserData['userId'].toString();
      _expiryDate = expiryDate;
    }
  }

  bool get isAuth {
    getSharedPreferences().then((value) {});
    bool doneRefresh = false;
    if (_expiryDate != null && _token != null && _refreshToken != null) {
      print('isAuth1 ');
      if (_expiryDate!.isAfter(DateTime.now())) {
        print('isAuth2 true');

        return true;
      } else {
        print('isAuth2 ');
        refreshSession().then((value) => doneRefresh = value);
        if (doneRefresh) {
          print('isAuth3 true');

          return true;
        } else {
          print('isAuth3 false');

          return false;
        }
      }
    } else {
      print('isAuth1 false');
      return false;
    }
  }

  Future<bool> refreshSession() async {
    print('refreshSession');
    const url =
        'https://securetoken.googleapis.com/v1/token?key=AIzaSyDAqidPTcelLXRsOk1XCpBFZ_hqgYXb0Y0';
    print(_refreshToken);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
          'grant_type': 'refresh_token',
          'refresh_token': _refreshToken,
        },
      );
      final responseData = json.decode(response.body);

      _token = responseData['id_token'];
      _refreshToken = responseData['refresh_token'];
      _userId = responseData['user_id'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expires_in'])));
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'refresh_token': _refreshToken,
        'userId': _userId,
        'expiryDate': _expiryDate!.toIso8601String(),
      });
      prefs.setString('userData', userData);
      return true;
    } catch (error) {
      print("refreshSession error: $error ");
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    _refreshToken = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  Future<void> authenticate(
      String email, String password, String urlSegement) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegement?key=AIzaSyDAqidPTcelLXRsOk1XCpBFZ_hqgYXb0Y0';

    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      _token = responseData['idToken'];
      _refreshToken = responseData['refreshToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));

      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'refresh_token': _refreshToken,
        'userId': _userId,
        'expiryDate': _expiryDate!.toIso8601String(),
      });
      prefs.setString('userData', userData);
    } catch (error) {
      print("authenticate error: $error ");
      print(error);
      rethrow;
    }
  }

  Future<void> signup() async {
    return authenticate(email, password, 'signUp');
  }

  Future<void> signin() async {
    return authenticate(email, password, 'signInWithPassword');
  }
}
