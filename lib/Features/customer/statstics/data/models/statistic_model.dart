class StatisticsModel {
  final int orders;
  final double? totalAmount;

  StatisticsModel({required this.orders, this.totalAmount});

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      orders: json['orders'],
      totalAmount:
          json['total_amount'] != null ? json['total_amount'].toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders,
      'total_amount': totalAmount,
    };
  }
}
