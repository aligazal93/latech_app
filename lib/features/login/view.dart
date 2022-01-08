import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/login/units/confirm_button.dart';
import 'package:latech_app/features/login/units/fields.dart';
import 'package:latech_app/features/login/units/signup_section.dart';
import 'package:latech_app/features/sign_up/view.dart';
import 'package:latech_app/widgets/app_bar.dart';
import 'package:latech_app/widgets/app_button.dart';
import 'package:latech_app/widgets/input_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: appBar('Login'),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: sizeFromHeight(10)),
          LoginFields(),
          LoginConfirmButton(),
          SizedBox(height: 20),
          LoginSignUpSection()
        ],
      ),
    );
  }
}
