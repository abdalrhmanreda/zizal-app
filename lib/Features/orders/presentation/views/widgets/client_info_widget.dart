import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:alzilzal/config/themes/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class ClientInfoWidget extends StatelessWidget {
  const ClientInfoWidget({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;

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
            S.of(context).clientInfo,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: AppColors.kGrayColor,
                ),
          ),
          Spacing.verticalSpace(10),
          Text(
            orderModel.customer,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
          ),
          Spacing.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  orderModel.address,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.kRedColor,
                      ),
                ),
              ),
              Spacing.horizontalSpace(10),
              Text(
                S.of(context).address,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeightHelper.regular,
                      color: AppColors.kGrayColor,
                    ),
              ),
            ],
          ),
          Spacing.verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderModel.customerNumber,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              Spacing.horizontalSpace(10),
              Text(
                S.of(context).phoneNum,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.kGrayColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}