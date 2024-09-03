import 'dart:async';

import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Features/sort_staff/presentation/views/sort_staff_layout_screen.dart';
import 'package:flutter/material.dart';

import '../../../../Core/constatnts/app_keys.dart';
import '../../../../Core/helpers/cachehelper.dart';
import '../../../../Core/themes/colors/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../auth/presentation/views/login_screen.dart';
import '../../../customer/layout/presentation/views/customer_layout_screen.dart';
import '../../../receiving_representative/home/presentation/views/receiving_layout_screen.dart';
import '../../../sending_representative/layout/presentation/views/sending_rep_layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3950), () {
      // Navigate to the main screen after the splash screen
      if (CacheHelper.getDate(key: AppKeys.accessTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.refreshTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.userRoleKey) == 'sort_staff') {
        AppFunctions.pushAndRemove(
          context: context,
          screen: const SortStaffLayoutScreen(),
        );
      } else if (CacheHelper.getDate(key: AppKeys.accessTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.refreshTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.userRoleKey) ==
              'Receiving representative') {
        AppFunctions.pushAndRemove(
          context: context,
          screen: const ReceivingLayoutScreen(),
        );
      } else if (CacheHelper.getDate(key: AppKeys.accessTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.refreshTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.userRoleKey) ==
              'Distribution representative') {
        AppFunctions.pushAndRemove(
          context: context,
          screen: const SendingRepLayoutScreen(),
        );
      } else if (CacheHelper.getDate(key: AppKeys.accessTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.refreshTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.userRoleKey) == 'client') {
        AppFunctions.pushAndRemove(
          context: context,
          screen: const UserLayoutScreen(),
        );
      } else if (CacheHelper.getDate(key: AppKeys.accessTokenKey) != null &&
          CacheHelper.getDate(key: AppKeys.refreshTokenKey) != null &&
          (CacheHelper.getDate(key: AppKeys.userRoleKey) ==
                  'client_assistant' ||
              CacheHelper.getDate(key: AppKeys.userRoleKey) == 'follow up')) {
        AppFunctions.pushAndRemove(
          context: context,
          screen: const UserLayoutScreen(),
        );
      } else {
        AppFunctions.pushAndRemove(
          context: context,
          screen: const LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Center(
        child: Image.asset(
          Assets.imagesZizla,
        ),
      ),
    );
  }
}
