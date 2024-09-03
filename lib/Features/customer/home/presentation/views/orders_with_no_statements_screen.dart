import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/constatnts/variables.dart';
import '../../../../../generated/l10n.dart';
import '../../../../orders/data/models/order_model.dart';
import '../../../../orders/presentation/views/order_details_screen.dart';

class OrdersWithNoStatementsScreen extends StatelessWidget {
  const OrdersWithNoStatementsScreen({Key? key, required this.ordersList})
      : super(key: key);

  final List<OrderModel> ordersList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).orders_with_no_statements,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ordersList.isEmpty
          ? Center(
              child: Text(
                S.of(context).thereIsNoOrders,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              itemBuilder: (context, index) => OrderItem(
                orderModel: ordersList[index],
              ),
              separatorBuilder: (context, index) => Spacing.verticalSpace(15),
              itemCount: ordersList.length,
            ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppFunctions.pushTo(
          context: context,
          screen: OrderDetailsScreen(
            orderModel: orderModel,
          ),
        );
      },
      child: Container(
        width: AppVariables.appSize(context).width,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.kGrayColor.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderModel.customer,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              orderModel.address,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.kRedColor,
                  ),
            ),
            Spacing.verticalSpace(5),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kSkyBlueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    S.of(context).ItWasDeliveredButNotBilled,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                  ),
                ),
                Spacing.horizontalSpace(15),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kSkyBlueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '#${orderModel.orderNumber}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                  ),
                ),
              ],
            ),
            Spacing.verticalSpace(10),
            Row(
              children: [
                Text(
                  orderModel.customerNumber,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.kGrayColor,
                      ),
                ),
                Spacing.horizontalSpace(25),
                Text(
                  AppFunctions.formatTimestamp(orderModel.createdAt),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.kGrayColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
