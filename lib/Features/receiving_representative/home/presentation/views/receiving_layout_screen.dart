import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Features/receiving_representative/home/presentation/views/receiving_history_screen.dart';
import 'package:alzilzal/Features/receiving_representative/home/presentation/views/receiving_home_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../profile/presentation/views/customer_profile_screen.dart';

// Receiving representative and Storekeeper
class ReceivingLayoutScreen extends StatefulWidget {
  const ReceivingLayoutScreen({Key? key}) : super(key: key);

  @override
  State<ReceivingLayoutScreen> createState() => _ReceivingLayoutScreenState();
}

class _ReceivingLayoutScreenState extends State<ReceivingLayoutScreen> {
  int selectedIndex = 0;
  List<Widget> widgets = [
    const ReceivingHomeScreen(),
    const ReceivingHistoryScreen(),
    const GeneralProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const double iconsSize = 25;
    return Scaffold(
      appBar: AppBar(
        // title: const AppName(),
        elevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: CustomNavigationBar(
          borderRadius: const Radius.circular(25),
          iconSize: iconsSize,
          selectedColor: MyColors.goldenColor,
          strokeColor: MyColors.goldenColor,
          unSelectedColor: Theme.of(context).iconTheme.color,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(IconlyBroken.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.history),
            ),
            CustomNavigationBarItem(
              icon: const Icon(IconlyBroken.profile),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      body: widgets[selectedIndex],
    );
  }
}
