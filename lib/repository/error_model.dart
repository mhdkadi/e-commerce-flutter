import 'package:flutter/material.dart';

class ErrorModel with ChangeNotifier {
  // ignore: prefer_final_fields
  List<String> _errors = [];
  void addError({required String error}) {
    if (!_errors.contains(error)) _errors.add(error);
    notifyListeners();
  }

  void removeError({required String error}) {
    if (_errors.contains(error)) _errors.remove(error);
    notifyListeners();
  }

  List<String> get errors => _errors;
}
