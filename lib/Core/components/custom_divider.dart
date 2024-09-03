import 'package:flutter/material.dart';

import '../themes/colors/app_colors.dart';

Widget myDivider(double width, double height) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.kGrayColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
