import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/profile/cubit/states.dart';
import 'package:latech_app/features/profile/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  Future<void> getProfileData()async{
    emit(ProfileLoadingState());
    try {
      final response = await DioHelper.get('profile');
      profileModel = ProfileModel.fromJson(response.data);
      // print(response.data);
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(ProfileInitState());
  }



}