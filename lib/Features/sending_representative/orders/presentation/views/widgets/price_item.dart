import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constatnts/spacing.dart';
import '../../../../../../Core/themes/colors/app_colors.dart';

class PriceItem extends StatelessWidget {
  const PriceItem({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
                color: AppColors.kGrayColor,
              ),
        ),
        Spacing.verticalSpace(5),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
              ),
        ),
      ],
    );
  }
}
