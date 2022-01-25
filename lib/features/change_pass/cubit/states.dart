abstract class ChangePassStates {}

class ChangePassInitState extends ChangePassStates {}

class ChangePassLoadingState extends ChangePassStates {}

class ChangePassErrorState extends ChangePassStates {
  String? error;
  ChangePassErrorState(this.error);
}