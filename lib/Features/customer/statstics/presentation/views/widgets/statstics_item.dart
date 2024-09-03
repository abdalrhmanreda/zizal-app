import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../Core/constatnts/variables.dart';
import '../../../../../../Core/themes/theme_provider.dart';

class StatsticsItem extends StatelessWidget {
  const StatsticsItem(
      {super.key,
      required this.number,
      required this.title,
      required this.width});
  final num number;
  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      width: width,
      height: 130.h,
      decoration: BoxDecoration(
        color: themeProvider.getIsDarkTheme
            ? Theme.of(context).scaffoldBackgroundColor.withOpacity(.6)
            : AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: AppVariables.appSize(context).width * 0.1,
            child: Text(
              "$number",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18.sp,
                  ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}
