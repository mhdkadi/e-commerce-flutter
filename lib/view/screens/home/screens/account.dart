import 'package:e_commerce_app/view_model/user_authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserAuthentication _userAuthentication =
        Provider.of<UserAuthentication>(context, listen: false);
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Sign Out'),
          onPressed: () {
            _userAuthentication.signOut();
          },
        ),
      ),
    );
  }
}
