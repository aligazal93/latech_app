import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/home/cubit/states.dart';
import 'package:latech_app/features/home/favourite_model.dart';
import 'package:latech_app/features/home/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStateInit());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  FavouriteModel? favouriteModel;
  late bool isFavourite;



  Future<void> getHomeData()async{
    emit(HomeStateLoading());
    try {
      final response = await DioHelper.get('home');
      homeModel = HomeModel.fromJson(response.data);

    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(HomeStateInit());
  }






}