import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/login/view.dart';
import 'package:latech_app/features/sign_up/view.dart';
import 'package:latech_app/widgets/app_button.dart';

class SplashNavigateButtons extends StatelessWidget {
  const SplashNavigateButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          AppButton(
            onPressed: () => MagicRouter.navigateAndPopAll(LoginView()),
            title: 'Login',
            backgroundColor: kWhiteColor,
          ),
          SizedBox(height: 8),
          AppButton(
            onPressed: () => MagicRouter.navigateAndPopAll(SignUpView()),
            title: 'Sign Up',
            backgroundColor: kWhiteColor,
          ),
        ],
      ),
    );
  }
}
