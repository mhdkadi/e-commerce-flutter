import 'package:e_commerce_app/data/test.dart';
import 'package:e_commerce_app/repository/auth_manager.dart';
import 'package:e_commerce_app/repository/user_authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UserAuthentication>(
          builder: (context, model, child) {
            return Column(
              children: [
                TextButton(
                  child: const Text('Sign Out'),
                  onPressed: () {
                    model.signOut();
                  },
                ),
                TextButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    AuthManager()
                        .signup('muhammad.kadi.1997@gmail.com', '1111111');
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
