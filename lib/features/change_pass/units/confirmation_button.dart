import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/change_pass/cubit/cubit.dart';
import 'package:latech_app/features/change_pass/cubit/states.dart';
import 'package:latech_app/widgets/app_button.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ChangePassCubit.get(context);
    return BlocBuilder(
      bloc: cubit,
      builder:(context, state) => state is ChangePassLoadingState ? LoadingIndicator() : Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          title: 'Confirm',
          onPressed: cubit.changePass,
          backgroundColor: kAccentColor,
        ),
      ),
    );
  }
}
