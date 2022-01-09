import 'package:flutter/cupertino.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/sign_up/cubit/cubit.dart';
import 'package:latech_app/widgets/input_text_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          SizedBox(
            height: sizeFromHeight(20),
          ),
          InputTextField(
            hintText: 'Full Name',
            upperText: 'Full Name',
            validator: (v) {
              if(v!.isEmpty)
                return 'Please enter Your Name';
              else
                return null;
            },
            onSaved: (v) => cubit.name = v,
          ),
          InputTextField(
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
            hintText: 'Phone',
            upperText: 'Phone Number',
            validator: (v) {
              if(v!.isEmpty)
                return 'Please enter Your Phone Number';
              else
                return null;
            },
            onSaved: (v) => cubit.phone = v,
          ),
          InputTextField(
            hintText: 'Password',
            upperText: 'Password',
            validator: (v) {
              if(v!.isEmpty)
                return 'Please enter Your Password';
              else
                return null;
            },
            onSaved: (v) => cubit.password = v,
          ),
        ],
      ),
    );
  }
}
