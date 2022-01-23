abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartErrorState extends CartStates {
  String? error;
  CartErrorState(this.error);
}