import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/login/view.dart';
import 'package:latech_app/features/sign_up/view.dart';
import 'package:latech_app/features/splash/units/buttons_navigate.dart';
import 'package:latech_app/features/splash/units/logo_splash.dart';
import 'package:latech_app/features/splash/units/upper_text.dart';
import 'package:latech_app/widgets/app_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashUpperText(),
          SplashLogo(),
          SplashNavigateButtons(),
        ],
      ),
    );
  }
}
