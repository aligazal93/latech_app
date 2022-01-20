import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/categories/model.dart';
import 'package:latech_app/features/category_details/cubit/states.dart';
import 'package:latech_app/features/category_details/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsStates> {
  CategoriesDetailsCubit(this.id) : super(CategoriesDetailsInitStates());

  static CategoriesDetailsCubit get(context) => BlocProvider.of(context);

  final int? id;

  CategoriesDetailsModel? categoriesDetailsModel;

  Future<void> getCategoriesDetailsData()async {
    emit(CategoriesDetailsLoadingStates());
    try {
      final response = await DioHelper.get('categories/$id');
      // print(response.data);
      categoriesDetailsModel = CategoriesDetailsModel.fromJson(response.data);
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(CategoriesDetailsInitStates());
  }
}
