import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constatnts/variables.dart';
import '../themes/colors/app_colors.dart';

class StatusOrderItem extends StatelessWidget {
  const StatusOrderItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.num,
      this.width})
      : super(key: key);

  final String image;
  final String title;
  final String num;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: width ?? AppVariables.appSize(context).width / 2.5,
              height: 125.h,
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.kGrayColor,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    num,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                  Spacing.verticalSpace(2),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.kPrimaryColor, width: 1),
          ),
          height: AppVariables.appSize(context).width * 0.14,
          child: Image.asset(
            image,
            color: AppColors.kPrimaryColor,
            fit: BoxFit.contain,
            width: 45.w,
          ),
        ),
      ],
    );
  }
}
