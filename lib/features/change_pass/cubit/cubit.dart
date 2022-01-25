import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/change_pass/cubit/states.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class ChangePassCubit extends Cubit<ChangePassStates>{
  ChangePassCubit() : super(ChangePassInitState());

  static ChangePassCubit get(context) => BlocProvider.of(context);

  String? current_pass, new_pass;
  final formKey = GlobalKey<FormState>();


  Future<void> changePass() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(ChangePassLoadingState());
    try {
      final response = await DioHelper.post(
          'change-password',
          data:{
            "current_password" : current_pass,
            "new_password" : new_pass,
          });
      final data = response.data;
      showSnackBar(data['message'], color: data['status'] ? Colors.green : Colors.red);
      if(data['status']){
        formKey.currentState!.reset();
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(ChangePassInitState());
  }

}