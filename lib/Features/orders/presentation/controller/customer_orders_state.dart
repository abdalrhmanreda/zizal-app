part of 'customer_orders_cubit.dart';

@immutable
abstract class CustomerOrdersState {}

class CustomerOrdersInitialState extends CustomerOrdersState {}

class LoadingOrdersCustomerOrdersState extends CustomerOrdersState {}

class ErrorOrdersCustomerOrdersState extends CustomerOrdersState {}

class SuccessOrdersCustomerOrdersState extends CustomerOrdersState {}
