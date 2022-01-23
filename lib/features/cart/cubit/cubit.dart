import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/dio_helper/dio_helper.dart';
import 'package:latech_app/features/cart/cubit/states.dart';
import 'package:latech_app/features/cart/model.dart';
import 'package:latech_app/widgets/snack_bar.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());

  static CartCubit get(context) => BlocProvider.of(context);

  CartModel? cartModel;


  Future<void> getCart()async {
    emit(CartLoadingState());
    try {
      final response = await DioHelper.get('carts');
      // print(response.data);
      cartModel = CartModel.fromJson(response.data);
      // print(response.data);
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(CartInitState());
  }

}