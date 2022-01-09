import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/login/cubit/states.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit of(context) => BlocProvider.of(context);

  String? email, password;
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(LoginLoading());
    try {
      final response = await DioHelper.post(
        'login',
        data: {"email": email, "password": password},
      );
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
    emit(LoginInit());
  }
}
