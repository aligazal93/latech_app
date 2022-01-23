import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/favorites/cubit/states.dart';
import 'package:latech_app/features/favorites/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class FavoritesCubit extends Cubit<FavoriteStates> {
  FavoritesCubit() : super(FavoriteInitState());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  FavoriteModel? favoriteModel;

  Future<void> getFavorites()async {
    emit(FavoriteLoadingState());
    try {
      final response = await DioHelper.get('favorites');
      // print(response.data);
      favoriteModel = FavoriteModel.fromJson(response.data);
      // print(response.data);

    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(FavoriteInitState());
  }


}