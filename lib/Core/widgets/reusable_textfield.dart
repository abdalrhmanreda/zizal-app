import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextFieldContainer extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? enable;
  final Widget? prefixIcon;
  final bool? isNotSee;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType inputType;
  final EdgeInsets? contentPadding;
  const ReusableTextFieldContainer({
    Key? key,
    required this.controller,
    this.hintText,
    this.enable,
    required this.onChanged,
    this.validator,
    this.prefixIcon,
    required this.inputType,
    this.suffixIcon,
    required this.isNotSee,
    this.onTap,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable ?? true,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.kBlackColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w100,
          ),
      textAlign: AppFunctions.isArabic() ? TextAlign.right : TextAlign.left,
      cursorColor: Colors.grey,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      keyboardType: inputType,
      obscureText: isNotSee ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: Colors.grey.withOpacity(0.2),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.kGrayColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w100,
            ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.buttonsColor!,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[600]!,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
      ),
    );
  }
}
