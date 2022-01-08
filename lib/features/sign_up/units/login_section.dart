import 'package:flutter/material.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/login/view.dart';

import '../../../constains.dart';

class SignUpLoginSection extends StatelessWidget {
  const SignUpLoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        MagicRouter.navigateAndReplacement(LoginView());
      },
      child: Center(
        child: Text(
          'You have an account? Login',
          style:
          TextStyle(fontWeight: FontWeight.bold, color: kYellowColor),
        ),
      ),
    );
  }
}
