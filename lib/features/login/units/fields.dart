import 'package:flutter/material.dart';
import 'package:latech_app/features/login/cubit/cubit.dart';
import 'package:latech_app/widgets/input_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          InputTextField(
            textInputType: TextInputType.emailAddress,
            hintText: 'Email',
            upperText: 'Email',
            validator: (v) {
              if(v!.isEmpty)
                return 'Please enter Your Email Address';
              else
                return null;
            },
            onSaved: (v) => cubit.email = v,
          ),
          InputTextField(
            obscureText: true,
            hintText: 'Password',
            upperText: 'Password',
            onSaved: (v) => cubit.password = v,
            validator: (v) {
              if(v!.isEmpty)
                return 'Please enter Your Password';
              else
                return null;
            },
          ),
        ],
      ),
    );
  }
}
