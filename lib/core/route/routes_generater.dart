import 'package:e_commerce_app/view/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';

import '/view/screens/Sign_In/sign_in.dart';
import '/view/screens/Sign_Up/sign_up.dart';
import '../../view/screens/home/home_screen.dart';
import 'wrapper.dart';

class Routes with ChangeNotifier {
  static Route<dynamic> routesGenerater(RouteSettings siettings) {
    dynamic arg = siettings.arguments;
    switch (siettings.name) {
      case '/Wrapper':
        return MaterialPageRoute(builder: (context) => const Wrapper());
      case '/HomeScreen':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/DetailsScreen':
        return MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  id: arg,
                ));
      case '/SignInScreen':
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case '/SignUpScreen':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
    }
  }
}
