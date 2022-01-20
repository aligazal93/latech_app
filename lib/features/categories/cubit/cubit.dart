import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/categories/cubit/states.dart';
import 'package:latech_app/features/categories/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesStateInitial());
  
  static CategoriesCubit get(context) => BlocProvider.of(context);
  
  CategoriesModel? categoriesModel;

  Future<void> getAllCategories()async {
    emit(CategoriesStateLoading());
    try {
      final response = await DioHelper.get('categories');
      categoriesModel = CategoriesModel.fromJson(response.data);
      // print(response.data);
    } catch (e) {
    showSnackBar(e.toString());
    }
    emit(CategoriesStateInitial());
  }
}