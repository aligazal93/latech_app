import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/sign_up/cubit/states.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit() : super(SignUpInitStates());
  static SignUpCubit of(context) => BlocProvider.of(context);

  String? email, name , phone , password;
  final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(SignUpLoadingStates());
    try {
      final response = await DioHelper.post(
          'register',
          data:{
            "email" : email,
            "name" : name,
            "phone" : phone,
            "password" : password,
          });
      final data = response.data;
      if(data['status']){
        // Home
        MagicRouter.navigateAndPopAll(SizedBox());
      } else {
        showSnackBar(data['message']);
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(SignUpInitStates());
  }


}