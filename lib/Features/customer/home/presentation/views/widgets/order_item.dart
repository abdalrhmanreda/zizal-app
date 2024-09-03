import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/assets_manager.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../orders/presentation/views/order_details_screen.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
        width: AppVariables.appSize(context).width,
        height: AppVariables.appSize(context).width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.kWhiteColor,
          boxShadow: const [
            BoxShadow(
              color: AppColors.kGrayColor,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AssetsManager.orderBoxImage,
                fit: BoxFit.cover,
                color: AppColors.kPrimaryColor,
                width: AppVariables.appSize(context).width * 0.17,
              ),
            ),
            Spacing.horizontalSpace(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        status(context)[orderModel.status!]!,
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
            )
          ],
        ),
      ),
    );
  }

  Map<String, String> status(context) {
    return {
      'inprogress': 'قيد المعالجة',
      'waiting_distribution': 'فى انتظار مندوب التوزيع',
      'recorded': 'تم تسجيل الطلب',
      'in-the-way': 'بالطريق مع المندوب',
      'delivered': 'تم تسليم الطلب',
      'replace': 'استبدال الطلب',
      'part-return': 'راجع جزئى',
      'full-return': 'راجع كلى',
      'wrp': 'عند مندوب الإستلام',
      'delayed': 'مؤجل',
      'change-data': 'تغيير عنوان',
      'resend': 'اعادة إرسال',
      'ready': 'جاهز للإرسال',
      'wait_transporter': 'فى انتظار الناقل',
      'transporter': 'على ذمه الناقل',
    };
  }
}
