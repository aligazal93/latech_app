import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/splash/view.dart';
import 'package:latech_app/widgets/pop_scaffold.dart';

import 'core/app_router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      title: 'LaTech App',
      theme: theme,
      builder: (context, child) => PopScaffold(child: child!),
      home: SplashView(),
    );
  }
}

