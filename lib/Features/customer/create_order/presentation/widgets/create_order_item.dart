import 'package:alzilzal/Core/components/app_text_form_feild.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/spacing.dart';
import '../../../../../generated/l10n.dart';

class CreateOrderItem extends StatelessWidget {
  const CreateOrderItem({
    super.key,
    required this.controller,
    required this.title,
    required this.label,
    required this.inputType,
    required this.maxLine,
    this.validate,
  });

  final TextEditingController controller;
  final String title;
  final String label;
  final TextInputType inputType;
  final int maxLine;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          //enable: areaDropValue == null ? false : true,
          type: inputType,
          maxLine: maxLine,
          controller: controller,
          validate: validate ??
              (String? value) {
                if (value!.isEmpty) {
                  return S.of(context).empty_field;
                }
                return null;
              },
          onChanged: (value) {},
          label: title,
          isPassword: false,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.kGrayColor,
            ),
          ),
          edgeInsetsGeometry: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 11.h,
          ),
        ),
        Spacing.verticalSpace(10),
      ],
    );
  }
}
