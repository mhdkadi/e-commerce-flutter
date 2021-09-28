import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/consts.dart';
import '../../data/auth_services.dart';
import '../../repository/error_model.dart';

TextFormField customPasswordFormField({required BuildContext context}) {
  final ErrorModel _errorModel =
      Provider.of<ErrorModel>(context, listen: false);
  final AuthServices _userAuthentication =
      Provider.of<AuthServices>(context, listen: false);

  return TextFormField(
    obscureText: true,
    onSaved: (newValue) =>
        _userAuthentication.changePassword(password: newValue!),
    onChanged: (value) {
      if (value.isNotEmpty) {
        _errorModel.removeError(error: kPassNullError);
      } else if (value.length >= 6) {
        _errorModel.removeError(error: kShortPassError);
      }
      _userAuthentication.changePassword(password: value);
    },
    validator: (value) {
      if (value!.isEmpty) {
        _errorModel.addError(error: kPassNullError);
        return "";
      } else if (value.length < 6) {
        _errorModel.addError(error: kShortPassError);
        return "";
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Password",
      hintText: "Enter your password",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(Icons.lock),
    ),
  );
}

TextFormField customEmailFormField({required BuildContext context}) {
  final ErrorModel _errorModel =
      Provider.of<ErrorModel>(context, listen: false);
  final AuthServices _userAuthentication =
      Provider.of<AuthServices>(context, listen: false);
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    onSaved: (newValue) => _userAuthentication.changeEmail(email: newValue!),
    onChanged: (value) {
      if (value.isNotEmpty) {
        _errorModel.removeError(error: kEmailNullError);
      } else if (emailValidatorRegExp.hasMatch(value)) {
        _errorModel.removeError(error: kInvalidEmailError);
      }
      //_userAuthentication.changeEmail(email: value);
    },
    validator: (value) {
      if (value!.isEmpty) {
        _errorModel.addError(error: kEmailNullError);
        return "";
      } else if (!emailValidatorRegExp.hasMatch(value)) {
        _errorModel.addError(error: kInvalidEmailError);
        return "";
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Email",
      hintText: "Enter your email",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(Icons.email),
    ),
  );
}

TextFormField customConformPasswordFormField({required BuildContext context}) {
  final ErrorModel _errorModel =
      Provider.of<ErrorModel>(context, listen: false);
  final AuthServices _userAuthentication =
      Provider.of<AuthServices>(context, listen: false);
  return TextFormField(
    obscureText: true,
    onSaved: (newVal) =>
        _userAuthentication.changeConformPassword(conformPassword: newVal!),
    onChanged: (value) {
      if (value.isNotEmpty) {
        _errorModel.removeError(error: kPassNullError);
      }
      if (value.isNotEmpty && _userAuthentication.password == value) {
        _errorModel.removeError(error: kMatchPassError);
      }
      _userAuthentication.changeConformPassword(conformPassword: value);
    },
    validator: (value) {
      if (value!.isEmpty) {
        _errorModel.addError(error: kPassNullError);
        return "";
      } else if ((_userAuthentication.password != value)) {
        _errorModel.addError(error: kMatchPassError);
        return "";
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Confirm Password",
      hintText: "Re-enter your password",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(Icons.lock),
    ),
  );
}
