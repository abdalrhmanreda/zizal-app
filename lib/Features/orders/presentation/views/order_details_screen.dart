import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:alzilzal/Features/orders/presentation/views/widgets/client_info_widget.dart';
import 'package:alzilzal/Features/orders/presentation/views/widgets/order_info.dart';
import 'package:alzilzal/Features/orders/presentation/views/widgets/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constatnts/spacing.dart';
import '../../../../generated/l10n.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();

  final OrderModel orderModel;
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).order,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.kGrayColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '#${widget.orderModel.orderNumber}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClientInfoWidget(
                orderModel: widget.orderModel,
              ),
              Spacing.verticalSpace(15),
              OrderInfo(
                orderModel: widget.orderModel,
              ),
              Spacing.verticalSpace(15),
              OrderStatus(orderModel: widget.orderModel),
            ],
          ),
        ),
      ),
    );
  }
}
