import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/config/themes/font_weight.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/constatnts/styles.dart';
import '../../../../../Core/constatnts/variables.dart';
import '../../../../../generated/l10n.dart';

class CustomDropDownList extends StatelessWidget {
  final String? profileDropValue;
  final ValueChanged<String?> onChanged;

  const CustomDropDownList({
    Key? key,
    required this.profileDropValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppVariables.appSize(context).width * 0.14,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        hint: Text(
          profileDropValue ?? S.of(context).profile,
          style: profileDropValue != null
              ? Theme.of(context).textTheme.bodyLarge
              : AppStyles.textStyle18.copyWith(
                  color: Colors.grey[600],
                ),
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeightHelper.regular,
            ),
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        value: profileDropValue,
        items: AppFunctions.profileDropDownList,
        onChanged: onChanged,
      ),
    );
  }
}
