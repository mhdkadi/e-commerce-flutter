import '../../../view_model/user_authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/size_configration.dart';
import '../../widgets/error.dart';
import '../../widgets/text_form_fields.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final UserAuthentication _userAuthentication =
        Provider.of<UserAuthentication>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          customEmailFormField(context: context),
          SizedBox(
            height:
                ScreenSize(context: context).getProportionateScreenHeight(30),
          ),
          customPasswordFormField(context: context),
          SizedBox(
            height:
                ScreenSize(context: context).getProportionateScreenHeight(30),
          ),
          customConformPasswordFormField(context: context),
          SizedBox(
            height:
                ScreenSize(context: context).getProportionateScreenHeight(20),
          ),
          const FormError(),
          SizedBox(
            height:
                ScreenSize(context: context).getProportionateScreenHeight(40),
          ),
          SizedBox(
            width: double.infinity,
            height:
                ScreenSize(context: context).getProportionateScreenHeight(56),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _userAuthentication.signUp();
                }
              },
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: ScreenSize(context: context)
                      .getProportionateScreenWidth(17),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}