import 'package:flutter/material.dart';

class SplashUpperText extends StatelessWidget {
  const SplashUpperText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text(
                  'LATECH',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'TECH MARKET',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
