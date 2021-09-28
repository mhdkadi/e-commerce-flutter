import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/size_configration.dart';
import '../../../data/auth_services.dart';
import '../../widgets/error.dart';
import '../../widgets/text_form_fields.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                ScreenSize(context: context).getProportionateScreenHeight(10),
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // TODO Forgot Password
                },
                child: SizedBox(
                  width: ScreenSize(context: context)
                      .getProportionateScreenWidth(130),
                  height: ScreenSize(context: context)
                      .getProportionateScreenHeight(30),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              )
            ],
          ),
          const FormError(),
          SizedBox(
            height:
                ScreenSize(context: context).getProportionateScreenHeight(20),
          ),
          SizedBox(
            width: double.infinity,
            height:
                ScreenSize(context: context).getProportionateScreenHeight(56),
            child: Consumer<AuthServices>(
              builder: (context, model, child) {
                return TextButton(
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
                      model.signin();
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
