part of 'receiving_cubit.dart';

@immutable
abstract class ReceivingState {}

class ReceivingInitialState extends ReceivingState {}

class LoadingCreatePackageReceivingState extends ReceivingState {}

class ErrorCreatePackageReceivingState extends ReceivingState {}

class SuccessCreatePackageReceivingState extends ReceivingState {}

class LoadingFetchHistoryReceivingState extends ReceivingState {}

class ErrorFetchHistoryReceivingState extends ReceivingState {}

class SuccessFetchHistoryReceivingState extends ReceivingState {}

class LoadingState extends ReceivingState {}

class SuccessState extends ReceivingState {}

class ErrorState extends ReceivingState {}

class AppointDistributionRepresentativeSuccessState extends ReceivingState {
  final String message;

  AppointDistributionRepresentativeSuccessState(this.message);
}
