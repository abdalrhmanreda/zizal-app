part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitialState extends OrderState {}

class LoadingAreasOrderState extends OrderState {}

class ErrorAreasOrderState extends OrderState {}

class SuccessAreasOrderState extends OrderState {
  final List<AreasModel> value;

  SuccessAreasOrderState(this.value);
}

class LoadingPagesOrderState extends OrderState {}

class ErrorPagesOrderState extends OrderState {}

class SuccessPagesOrderState extends OrderState {
  final List<PageModel> value;

  SuccessPagesOrderState(this.value);
}

class LoadingCreateOrderState extends OrderState {}

class ErrorCreateOrderState extends OrderState {}

class SuccessCreateOrderState extends OrderState {
  final CreateModel value;

  SuccessCreateOrderState(this.value);
}

class LoadingGetPhoneState extends OrderState {}

class ErrorGetPhoneState extends OrderState {}

class SuccessGetPhoneState extends OrderState {
  final String value;

  SuccessGetPhoneState(this.value);
}

class LoadingSendNotOrderState extends OrderState {}

class ErrorSendNotOrderState extends OrderState {}

class SuccessSendNotOrderState extends OrderState {}

class LoadingExtractAreaFromGovernate extends OrderState {}

class ErrorExtractAreaFromGovernate extends OrderState {}

class SuccessExtractAreaFromGovernate extends OrderState {}

class ValuesClearedOrderState extends OrderState {}
