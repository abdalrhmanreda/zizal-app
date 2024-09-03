import 'package:alzilzal/Core/components/custom_divider.dart';
import 'package:alzilzal/Features/sending_representative/home/data/models/rep_orders_model.dart';
import 'package:alzilzal/Features/sending_representative/orders/presentation/views/widgets/price_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constatnts/spacing.dart';
import '../../../../../../Core/themes/colors/app_colors.dart';
import '../../../../../../generated/l10n.dart';

class OrderInfoSending extends StatelessWidget {
  const OrderInfoSending({Key? key, required this.orderModel})
      : super(key: key);
  final InTheWayOrders orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGrayColor.withOpacity(0.2),
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
            S.of(context).order_details,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: AppColors.kGrayColor,
                ),
          ),
          Spacing.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  S.of(context).type,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.kGrayColor,
                      ),
                ),
              ),
              Text(
                '${orderModel.type}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ],
          ),
          Spacing.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).notes,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.kGrayColor,
                    ),
              ),
              Text(
                '${orderModel.notes}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ],
          ),
          Spacing.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).price,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.kGrayColor,
                    ),
              ),
              Text(
                '${orderModel.amount}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ],
          ),
          Spacing.verticalSpace(10),
          Row(
            children: [
              PriceItem(
                title: S.of(context).delivery_amount,
                price: '${orderModel.deliveryAmount}',
              ),
              Spacing.horizontalSpace(20),
              myDivider(2, 50.h),
              Spacing.horizontalSpace(20),
              PriceItem(
                title: S.of(context).received_amount,
                price: '${orderModel.recievedAmount}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
