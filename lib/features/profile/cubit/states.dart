abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  String? error;
  ProfileErrorState(this.error);
}