import 'package:e_commerce_app/view_model/products_api_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './core/route/routes_generater.dart';
import './core/themes.dart';
import './view_model/error_model.dart';
import './view_model/user_authentication_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ErrorModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserAuthentication(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: theme(),
      initialRoute: '/Wrapper',
      onGenerateRoute: Routes.routesGenerater,
    );
  }
}