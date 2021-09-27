import 'package:e_commerce_app/data/test.dart';

class AuthManager {
  final Auth _auth = Auth();
  Future<void> signup(String email, String password) async {
    return _auth.authenticate(email, password, 'signUp');
  }

  Future<void> signin(String email, String password) async {
    return _auth.authenticate(email, password, 'signInWithPassword');
  }
}
