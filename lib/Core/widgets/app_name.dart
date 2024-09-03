import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../constatnts/app_strings.dart';
import '../constatnts/colors.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppFunctions.isArabic()) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/appBar_logo.gif',
            height: 40,
          ),
          const SizedBox(
            width: 5,
          ),
          Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Colors.black,
            highlightColor: MyColors.goldenColor,
            child: Text(
              AppStrings.appNameAr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 19.sp,
                  ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/appBar_logo.gif',
            height: 60.h,
          ),
          Spacing.horizontalSpace(5),
          Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Colors.black,
            highlightColor: MyColors.goldenColor,
            child: Text(
              AppFunctions.isArabic()
                  ? AppStrings.appNameAr
                  : AppStrings.appNameEn,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 19.sp,
                  ),
            ),
          ),
        ],
      );
    }
  }
}
