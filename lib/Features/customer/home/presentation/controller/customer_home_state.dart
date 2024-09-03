part of 'customer_home_cubit.dart';

@immutable
abstract class CustomerHomeState {}

class CustomerHomeInitialState extends CustomerHomeState {}

class LoadingBannersCustomerHomeState extends CustomerHomeState {}

class ErrorBannersCustomerHomeState extends CustomerHomeState {}

class SuccessBannersCustomerHomeState extends CustomerHomeState {}

class LoadingOrdersCustomerHomeState extends CustomerHomeState {}

class ErrorOrdersCustomerHomeState extends CustomerHomeState {}

class SuccessOrdersCustomerHomeState extends CustomerHomeState {}

class SuccessOrdersNumbersSuccessHomeState extends CustomerHomeState {}

class LoadingOrdersWithNoStatementCustomerHomeState extends CustomerHomeState {}

class ErrorOrdersWithNoStatementCustomerHomeState extends CustomerHomeState {}

class SuccessOrdersWithNoStatementCustomerHomeState extends CustomerHomeState {}
