import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/features/login/cubit/cubit.dart';
import 'package:latech_app/features/login/cubit/states.dart';
import 'package:latech_app/widgets/app_button.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class LoginConfirmButton extends StatelessWidget {
  const LoginConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => state is LoginLoading ? LoadingIndicator() : AppButton(
        onPressed: cubit.login,
        title: 'Login',
        backgroundColor: Colors.white,
      ),
    );
  }
}
