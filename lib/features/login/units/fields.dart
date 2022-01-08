import 'package:flutter/material.dart';
import 'package:latech_app/widgets/input_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextField(
          hintText: 'Email',
          upperText: 'Email',
        ),
        InputTextField(
          hintText: 'Password',
          upperText: 'Password',
        ),
      ],
    );
  }
}
