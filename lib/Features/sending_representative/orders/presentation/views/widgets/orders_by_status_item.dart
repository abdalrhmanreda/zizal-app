import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../Core/constatnts/spacing.dart';
import '../../../../../../Core/constatnts/variables.dart';
import '../../../../../../Core/themes/colors/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../home/data/models/rep_orders_model.dart';

class OrdersByStatusItem extends StatelessWidget {
  const OrdersByStatusItem({Key? key, required this.order}) : super(key: key);
  final InTheWayOrders order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppVariables.appSize(context).width,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
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
            order.customer!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            order.address!,
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
                  statusMap(context)[order.status!]!,
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
                  '#${order.orderNumber}',
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
                order.customerNumber!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.kGrayColor,
                    ),
              ),
              Spacing.horizontalSpace(25),
              Text(
                formatTimestamp(order.createdAt!),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.kGrayColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatTimestamp(String timestamp) {
    // Parse the input timestamp
    DateTime dateTime = DateTime.parse(timestamp);

    // Define the output format (single digits for day and month)
    DateFormat outputFormat = DateFormat('d-M-yyyy HH:mm:ss');

    // Format the parsed DateTime
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  Map<String, String> statusMap(context) => {
        'inprogress': S.of(context).status_inprogress,
        'waiting_distribution': S.of(context).status_waiting_distribution,
        'recorded': S.of(context).status_recorded,
        'in-the-way': S.of(context).status_in_the_way,
        'delivered': S.of(context).status_delivered,
        'replace': S.of(context).status_replace,
        'part-return': S.of(context).status_part_return,
        'full-return': S.of(context).status_full_return,
        'wrp': S.of(context).status_wrp,
        'delayed': S.of(context).status_delayed,
        'change-data': S.of(context).status_change_data,
        'resend': S.of(context).status_resend,
        'ready': S.of(context).status_ready,
        'wait_transporter': S.of(context).status_wait_transporter,
        'transporter': S.of(context).status_transporter,
      };
}
