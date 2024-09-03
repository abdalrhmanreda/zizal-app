part of 'statements_cubit.dart';

abstract class StatementsState {}

class StatementsInitialState extends StatementsState {}

class LoadingStatementsState extends StatementsState {}

class ErrorStatementsState extends StatementsState {}

class SuccessStatementsState extends StatementsState {}

class LoadingFetchPagesStatementsState extends StatementsState {}

class ErrorFetchPagesStatementsState extends StatementsState {}

class SuccessFetchPagesStatementsState extends StatementsState {}

class SetFromDateState extends StatementsState {
  final DateTime fromDate;
  SetFromDateState(this.fromDate);
}

class SetToDateState extends StatementsState {
  final DateTime toDate;
  SetToDateState(this.toDate);
}
