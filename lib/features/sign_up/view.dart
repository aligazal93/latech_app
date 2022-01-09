import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/sign_up/cubit/cubit.dart';
import 'package:latech_app/features/sign_up/units/confirm_button.dart';
import 'package:latech_app/features/sign_up/units/fields.dart';
import 'package:latech_app/features/sign_up/units/login_section.dart';
import 'package:latech_app/widgets/app_bar.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: appBar('Sign Up'),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SignUpFields(),
            SignUpConfirmButton(),
            SizedBox(height: 20),
            SignUpLoginSection(),
          ],
        ),
      ),
    );
  }
}
