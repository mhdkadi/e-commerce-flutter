import '../../view/screens/Sign_In/sign_in.dart';
import '../../view/screens/home/home_screen.dart';
import '../../view/screens/loading/loading_screen.dart';
import '../../view/screens/no_connection/no_connection_screen.dart';
import '../../view_model/user_authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserAuthentication _userAuthentication =
        Provider.of<UserAuthentication>(context, listen: false);
    return StreamBuilder(
        stream: _userAuthentication.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return const SignInScreen();
            } else {
              _userAuthentication.setUid();
              return const HomeScreen();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            return const NoConnectionScreen();
          }
        });
  }
}
