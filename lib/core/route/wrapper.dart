import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/auth_services.dart';
import '../../view/screens/Sign_In/sign_in.dart';
import '../../view/screens/home/home_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    final AuthServices _authManager =
        Provider.of<AuthServices>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _authManager.notify();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServices>(builder: (context, auth, child) {
      print("Wrapper: ${auth.isAuth}");
      return auth.isAuth ? const HomeScreen() : const SignInScreen();
    });
  }
}
