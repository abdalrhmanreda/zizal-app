import 'package:flutter/material.dart';

import '../../../../../Core/widgets/app_name.dart';
import '../../../../customer/layout/presentation/views/widgets/custom_nav_bar.dart';
import '../../../../customer/statstics/presentation/views/customer_statistics_screen.dart';
import '../../../../profile/presentation/views/customer_profile_screen.dart';
import '../../../../statments/presentation/views/statements_screen.dart';
import '../../../home/presentation/views/sending_rep_home_screen.dart';

class SendingRepLayoutScreen extends StatefulWidget {
  const SendingRepLayoutScreen({Key? key}) : super(key: key);

  @override
  State<SendingRepLayoutScreen> createState() => _SendingRepLayoutScreenState();
}

class _SendingRepLayoutScreenState extends State<SendingRepLayoutScreen> {
  int selectedIndex = 0;
  List<Widget> widgets = [
    const SendingRepHomeScreen(),
    const StatementsScreen(),
    const UserStatisticsScreen(),
    const GeneralProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double iconsSize = 25;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppName(),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppFunctions.pushTo(
              context: context, screen: const SendingRepCreateOrderScreen());
        },
        child: const Icon(Icons.add),
      ),*/
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: widgets[selectedIndex],
    );
  }
}
