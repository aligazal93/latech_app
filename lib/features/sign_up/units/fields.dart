import 'package:flutter/cupertino.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/widgets/input_text_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizeFromHeight(20),
        ),
        InputTextField(
          hintText: 'Full Name',
          upperText: 'Full Name',
        ),
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
