import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/search/cubit/states.dart';
import 'package:latech_app/features/search/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitState());

  static SearchCubit get(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  SearchModel? searchModel;
  Future<void> getSearchData(String? text) async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(SearchLoadingState());
    try {
      print(text);
      final response = await DioHelper.post('products/search', data: {
        'text': text,
      });
      searchModel = SearchModel.fromJson(response.data);
      final data = response.data;
      if (searchModel!.data!.data!.isEmpty) {
        // print(text);
      }else{
        emit(SearchInitState());
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(SearchInitState());
  }
}
