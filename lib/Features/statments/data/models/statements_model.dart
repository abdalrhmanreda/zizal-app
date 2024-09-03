import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:equatable/equatable.dart';

class StatementsModel extends Equatable {
  final String clientName;
  final String page;
  final List<OrderModel> orders;
  final int ordersCount;
  final double totalAmount;

  const StatementsModel({
    required this.clientName,
    required this.page,
    required this.orders,
    required this.ordersCount,
    required this.totalAmount,
  });

  factory StatementsModel.fromJson(Map<String, dynamic> json) =>
      StatementsModel(
        clientName: json['client_name'],
        page: json['page'],
        orders: List<OrderModel>.from(
            json['orders'].map((x) => OrderModel.fromJson(x))),
        ordersCount: json['orders_count'],
        totalAmount: double.parse(json['total_amount'].toString()),
      );

  @override
  List<Object?> get props =>
      [clientName, page, orders, ordersCount, totalAmount];
}

// Note: Additional classes for any other nested structures in your JSON can be created similarly.
