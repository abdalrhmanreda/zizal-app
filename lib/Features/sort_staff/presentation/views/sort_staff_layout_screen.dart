import 'package:alzilzal/Features/sort_staff/presentation/views/sort_history_screen.dart';
import 'package:alzilzal/Features/sort_staff/presentation/views/sort_staff_home_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../Core/themes/colors/app_colors.dart';
import '../../../profile/presentation/views/customer_profile_screen.dart';

// SortStaff representative and Storekeeper
class SortStaffLayoutScreen extends StatefulWidget {
  const SortStaffLayoutScreen({Key? key}) : super(key: key);

  @override
  State<SortStaffLayoutScreen> createState() => _SortStaffLayoutScreenState();
}

class _SortStaffLayoutScreenState extends State<SortStaffLayoutScreen> {
  int selectedIndex = 0;
  final List<Widget> widgets = [
    const SortStaffHomeScreen(),
    const SortHistoryScreen(),
    const GeneralProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double iconsSize = 25;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        // title: const AppName(),
        elevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: CustomNavigationBar(
          borderRadius: const Radius.circular(20),
          iconSize: 30,
          selectedColor: AppColors.kPrimaryColor,
          strokeColor: AppColors.kPrimaryColor,
          unSelectedColor: AppColors.kGreyColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(IconlyLight.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.history),
            ),
            CustomNavigationBarItem(
              icon: const Icon(IconlyLight.profile),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      body: widgets[selectedIndex],
    );
  }
}
