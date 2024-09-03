import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    // Determine if the user is a client
    bool isClient = CacheHelper.getDate(key: 'role') == 'client';

    // Build the navigation items based on the role
    List<CustomNavigationBarItem> items = [
      CustomNavigationBarItem(
        icon: const Icon(IconlyBroken.home),
      ),
      if (isClient)
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.receipt_2_1_outline),
        ),
      if (isClient)
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.chart_outline),
        ),
      CustomNavigationBarItem(
        icon: const Icon(IconlyBroken.profile),
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      child: SizedBox(
        height: 60.h,
        child: CustomNavigationBar(
          borderRadius: Radius.circular(25.r),
          iconSize: 25,
          selectedColor: AppColors.kPrimaryColor,
          strokeColor: AppColors.kPrimaryColor,
          unSelectedColor: Theme.of(context).iconTheme.color,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: items, // Pass the dynamically created items list
          currentIndex: selectedIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
