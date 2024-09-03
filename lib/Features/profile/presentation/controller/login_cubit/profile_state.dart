part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class LoadingLogoutProfileState extends ProfileState {}

class ErrorLogoutProfileState extends ProfileState {}

class SuccessLogoutProfileState extends ProfileState {
  final LogoutModel value;

  SuccessLogoutProfileState(this.value);
}

class LoadingFetchInfoProfileState extends ProfileState {}

class ErrorFetchInfoProfileState extends ProfileState {}

class SuccessFetchInfoProfileState extends ProfileState {
  final UserInfoModel value;

  SuccessFetchInfoProfileState(this.value);
}
