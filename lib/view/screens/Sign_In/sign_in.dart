import 'package:flutter/material.dart';

import '../../../core/size_configration.dart';
import '../../../view/screens/Sign_In/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top:
                  ScreenSize(context: context).getProportionateScreenHeight(16),
            ),
            child: SizedBox(
              width: 26,
              height: 26,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenSize(context: context)
                        .getProportionateScreenWidth(26),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  ScreenSize(context: context).getProportionateScreenWidth(18),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenSize(context: context)
                        .getProportionateScreenHeight(10),
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenSize(context: context)
                          .getProportionateScreenWidth(26),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ScreenSize(context: context)
                        .getProportionateScreenHeight(80),
                  ),
                  const SignInForm(),
                  SizedBox(
                    height: ScreenSize(context: context)
                        .getProportionateScreenHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          fontSize: ScreenSize(context: context)
                              .getProportionateScreenWidth(15),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/SignUpScreen');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: ScreenSize(context: context)
                                  .getProportionateScreenWidth(15),
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
