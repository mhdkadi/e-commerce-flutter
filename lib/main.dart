import 'data/auth_services.dart';
import 'repository/srevice_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/route/routes_generater.dart';
import 'core/themes.dart';
import 'repository/error_model.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ErrorModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthServices(),
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
