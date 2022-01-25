import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/features/change_pass/cubit/cubit.dart';
import 'package:latech_app/features/change_pass/cubit/states.dart';
import 'package:latech_app/features/change_pass/units/confirmation_button.dart';
import 'package:latech_app/features/change_pass/units/text_fields.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/input_text_field.dart';

import '../../constains.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2(''),
      body: BlocProvider(
        create: (context) => ChangePassCubit(),
        child: BlocBuilder<ChangePassCubit , ChangePassStates>(
          builder: (context, state) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Text('Change Password',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22),),
                ),
                TextFieldsInput(),
                SizedBox(height: 50),
                ConfirmationButton()



              ],
            );
          },
        ),
      )
    );
  }
}
