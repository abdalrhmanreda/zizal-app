import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Features/customer/layout/presentation/views/widgets/bottom_sheet_for_scan_or_create.dart';
import 'package:alzilzal/Features/customer/layout/presentation/views/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../config/route_path.dart';
import '../../../../../generated/l10n.dart';
import '../../../../profile/presentation/views/customer_profile_screen.dart';
import '../../../../statments/presentation/views/statements_screen.dart';
import '../../../create_order/data/models/scan_screen_arguments.dart';
import '../../../home/presentation/views/customer_home_screen.dart';
import '../../../statstics/presentation/views/customer_statistics_screen.dart';

class UserLayoutScreen extends StatefulWidget {
  const UserLayoutScreen({Key? key}) : super(key: key);

  @override
  State<UserLayoutScreen> createState() => _UserLayoutScreenState();
}

class _UserLayoutScreenState extends State<UserLayoutScreen> {
  int selectedIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = _getScreensBasedOnRole();
  }

  bool get isClient => CacheHelper.getDate(key: 'role') == 'client';

  List<Widget> _getScreensBasedOnRole() {
    if (isClient) {
      return [
        const CustomerHomeScreen(),
        const StatementsScreen(),
        const UserStatisticsScreen(),
        const GeneralProfileScreen(),
      ];
    } else {
      return [
        const CustomerHomeScreen(),
        const GeneralProfileScreen(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: isClient && selectedIndex == 2
            ? Text(
                S.of(context).statistics,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20.sp,
                    ),
              )
            : null,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              context.navigateToWidgetByNamed(context, RoutePath.search);
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: isClient
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endDocked,
      floatingActionButton: isClient
          ? FloatingActionButton(
              onPressed: _showBottomSheet,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: screens[selectedIndex],
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => SizedBox(
        height: AppConstant.deviceHeight(context) / 2.5,
        width: AppConstant.deviceWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScanOrCreate(
              icon: Iconsax.add_outline,
              title: S.of(context).create_order,
              onTap: () {
                Navigator.of(context).pop();
                context.navigateToWidgetByNamed(
                  context,
                  RoutePath.createOrderScreen,
                  arguments: ScanScreenArguments(
                    isQrCode: false,
                  ),
                );
              },
            ),
            ScanOrCreate(
              icon: Iconsax.camera_outline,
              title: S.of(context).scanQRCode,
              onTap: () {
                Navigator.of(context).pop();
                context.navigateToWidgetByNamed(context, RoutePath.scanScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
