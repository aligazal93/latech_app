import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/favorites/model.dart';
import 'package:latech_app/features/product/cubit/states.dart';
import 'package:latech_app/features/product/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this.id) : super(ProductInitState());

  static ProductCubit get(context) => BlocProvider.of(context);

  final int? id;
  ProductDetailsModel? productDetailsModel;

  Future<void> getProductDetails()async {
    emit(ProductLoadingState());
    try {
      final response = await DioHelper.get('products/$id');
      // print(response.data);
      productDetailsModel = ProductDetailsModel.fromJson(response.data);
      // print(response.data);

    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(ProductInitState());
  }

  Future<void> toggleFavorite()async{
    try {
      final response = await DioHelper.post('favorites',
          data: {'product_id' : id}
      );
      showSnackBar(response.data['message']);
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  Future<void> addCart()async{
    try {
      final response = await DioHelper.post('carts',
          data: {'product_id' : id}
      );
      print(response.data);
      showSnackBar(response.data['message']);
    } catch (e) {
      showSnackBar(e.toString());
    }
  }


}