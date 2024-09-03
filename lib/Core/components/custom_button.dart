import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constatnts/app_constant.dart';
import '../themes/colors/app_colors.dart';

class CustomAppButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? edgeInsets;

  const CustomAppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.radius,
    this.height,
    this.width,
    this.color,
    this.textStyle,
    this.edgeInsets,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: edgeInsets ??
          EdgeInsets.symmetric(
            vertical: 14.h,
          ),
      width: width ?? AppConstant.deviceWidth(context),
      height: height ?? 47.h,
      decoration: BoxDecoration(
        color: color ?? AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(radius ?? 16.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style,
        child: Text(
          text,
          style: textStyle ??
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kWhiteColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
