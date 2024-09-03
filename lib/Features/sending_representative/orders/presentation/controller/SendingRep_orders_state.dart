part of 'sending_rep_orders_cubit.dart';

@immutable
abstract class SendingRepOrdersState {}

class SendingRepOrdersInitialState extends SendingRepOrdersState {}

class LoadingOrdersSendingRepOrdersState extends SendingRepOrdersState {}

class ErrorOrdersSendingRepOrdersState extends SendingRepOrdersState {}

class SuccessOrdersSendingRepOrdersState extends SendingRepOrdersState {}

class ChangeOrderStatusLoadingSendingRepOrdersState
    extends SendingRepOrdersState {}

class ChangeOrderStatusSendingRepOrdersState extends SendingRepOrdersState {
  final InTheWayOrders updatedOrder;

  ChangeOrderStatusSendingRepOrdersState({required this.updatedOrder});
}

class ChangeOrderStatusErrorSendingRepOrdersState
    extends SendingRepOrdersState {}
