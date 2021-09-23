// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserAuthentication with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';
  String _conformPassword = '';
  String _uid = '';
  void changeEmail({required String email}) {
    _email = email;
    notifyListeners();
  }

  void setUid() {
    _uid = _auth.currentUser!.uid;
  }

  void changePassword({required String password}) {
    _password = password;

    notifyListeners();
  }

  void changeConformPassword({required String conformPassword}) {
    _conformPassword = conformPassword;

    notifyListeners();
  }

  String get email => _email;
  String get uid => _uid;
  String get password => _password;
  String get cnformPassword => _conformPassword;
  Future<String> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print("Signed In");
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      print("Faild To Sign In Error: $e");
      return "Faild To Sign In";
    }
  }

  Future<String> signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      print("Signed Up");
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      print("Faild To Sign Up Error: $e");
      return "Faild To Sign Up";
    }
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<String> signOut() async {
    try {
      await _auth.signOut();
      print("Signed Out");
      return "Signed Out";
    } on FirebaseAuthException catch (e) {
      print("Faild To Sign Out Error: $e");
      return "Faild To Sign Out";
    }
  }
}
