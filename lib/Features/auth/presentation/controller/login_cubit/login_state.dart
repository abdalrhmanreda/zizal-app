part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final LoginModel value;

  SuccessLoginState(this.value);
}

class LoadingCreateFCMLoginState extends LoginState {}

class ErrorCreateFCMLoginState extends LoginState {}

class SuccessCreateFCMLoginState extends LoginState {}

class LoadingAddFCMLoginState extends LoginState {}

class ErrorAddFCMLoginState extends LoginState {}

class SuccessAddFCMLoginState extends LoginState {}
