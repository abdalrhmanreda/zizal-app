import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  static Widget verticalSpace(double height) => SizedBox(
        height: height.h,
      );
  static Widget horizontalSpace(double width) => SizedBox(
        width: width.w,
      );
}
