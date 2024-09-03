import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/app_constant.dart';
import '../../../../../Core/themes/colors/app_colors.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? value;
  final List<DropdownMenuItem<String>>?
      items; // Change the type to List<String>?
  final String? hintText;
  final Function(String?)? onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.deviceWidth(context),
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.kGrayColor,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              hintText ?? '',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: value != null
                        ? AppColors.kBlackColor
                        : Colors.grey[400],
                    fontSize: 15.sp,
                  ),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18.sp,
              ),
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          isExpanded: true,
          value: value,
          items: items, // Add null check and default empty list
          onChanged: onChanged,
        ),
      ),
    );
  }
}
