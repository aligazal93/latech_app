import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/login/cubit/cubit.dart';
import 'package:latech_app/features/login/units/confirm_button.dart';
import 'package:latech_app/features/login/units/fields.dart';
import 'package:latech_app/features/login/units/signup_section.dart';
import 'package:latech_app/widgets/app_bar.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
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
      ),
    );
  }
}
