abstract class CategoriesDetailsStates {}

 class CategoriesDetailsInitStates extends CategoriesDetailsStates {}

 class CategoriesDetailsLoadingStates extends CategoriesDetailsStates {}

 class CategoriesDetailsErrorStates extends CategoriesDetailsStates {
  String? error;
  CategoriesDetailsErrorStates({this.error});

}
