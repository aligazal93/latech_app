import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/features/sign_up/cubit/cubit.dart';
import 'package:latech_app/features/sign_up/cubit/states.dart';
import 'package:latech_app/widgets/app_button.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class SignUpConfirmButton extends StatelessWidget {
  const SignUpConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder:(context, state) => state is SignUpLoadingStates ? LoadingIndicator() : AppButton(
        onPressed: cubit.signUp,
        title: 'Register',
        backgroundColor: Colors.white,
      ),
    );
  }
}
