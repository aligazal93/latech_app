import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/core/app_storage/app_storage.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/splash/view.dart';
import 'package:latech_app/widgets/pop_scaffold.dart';

import 'core/app_router/router.dart';

// aligazal93@gmail.com
// 123456789

void main() async {
  await AppStorage.init();
  DioHelper.init();
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
      home: AppStorage.isLogged ? SizedBox() : SplashView(),
    );
  }
}

