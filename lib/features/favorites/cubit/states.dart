abstract class FavoriteStates {}

class FavoriteInitState extends FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {}

class FavoriteErroeState extends FavoriteStates {
  String? error;
  FavoriteErroeState(this.error);
}