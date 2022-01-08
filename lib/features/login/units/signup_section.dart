import 'package:flutter/material.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/sign_up/view.dart';

import '../../../constains.dart';

class LoginSignUpSection extends StatelessWidget {
  const LoginSignUpSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => MagicRouter.navigateAndReplacement(SignUpView()),
      child: Text(
        'Don’t have an account? Sign-up',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kYellowColor
        ),
      ),
    );
  }
}
