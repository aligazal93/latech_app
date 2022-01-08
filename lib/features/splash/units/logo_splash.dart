import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: sizeFromHeight(2),
          width: sizeFromWidth(1),
        ));
  }
}
