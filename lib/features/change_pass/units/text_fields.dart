import 'package:flutter/material.dart';
import 'package:latech_app/features/change_pass/cubit/cubit.dart';
import 'package:latech_app/features/sign_up/cubit/cubit.dart';
import 'package:latech_app/widgets/input_text_field2.dart';


class TextFieldsInput extends StatelessWidget {
  const TextFieldsInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ChangePassCubit.get(context);
    return Form(
      key: cubit.formKey,
    child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Current Password',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            child: InputTextField2(
              validator: (v) {
                if(v!.isEmpty)
                  return 'Please enter Your Current Pass';
                else
                  return null;
              },
              onSaved: (v) => cubit.current_pass = v,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('New Password',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            child: InputTextField2(
              validator: (v) {
                if(v!.isEmpty)
                  return 'Please enter Your New Password';
                else
                  return null;
              },
              onSaved: (v) => cubit.new_pass = v,
            ),
          ),
        ],
      ),
    );
  }
}
