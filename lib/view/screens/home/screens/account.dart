import 'package:e_commerce_app/view_model/user_authentication_model.dart';
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
            return TextButton(
              child: const Text('Sign Out'),
              onPressed: () {
                model.signOut();
              },
            );
          },
        ),
      ),
    );
  }
}
