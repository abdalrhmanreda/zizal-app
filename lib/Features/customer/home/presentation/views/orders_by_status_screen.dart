import 'package:flutter/material.dart';

import '../../../../orders/presentation/views/customer_orders_screen.dart';

class OrdersByStatusScreen extends StatelessWidget {
  const OrdersByStatusScreen(
      {Key? key, required this.title, required this.status})
      : super(key: key);

  final String title;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: UserOrdersScreen(status: status),
    );
  }
}
