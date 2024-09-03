import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constatnts/app_functions.dart';
import '../../../../Core/constatnts/spacing.dart';
import '../../../../Core/themes/colors/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../orders/presentation/views/order_details_screen.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.searchModel});
  final OrderModel searchModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppFunctions.pushTo(
          context: context,
          screen: OrderDetailsScreen(
            orderModel: searchModel,
          ),
        );
      },
      child: Container(
        width: AppConstant.deviceWidth(context),
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
              searchModel.customer!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              searchModel.address!,
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
                    '#${searchModel.orderNumber}',
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
                  searchModel.customerNumber!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.kGrayColor,
                      ),
                ),
                Spacing.horizontalSpace(25),
                Text(
                  AppFunctions.formatTimestamp(searchModel.createdAt!),
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
