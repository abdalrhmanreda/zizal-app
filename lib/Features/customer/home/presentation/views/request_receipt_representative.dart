import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:flutter/material.dart';

import '../../../create_order/presentation/views/choose_screen.dart';

class RequestReceiptRepresentative extends StatelessWidget {
  const RequestReceiptRepresentative({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppConstant.deviceHeight(context) / 8),
            const Center(child: ChooseScreenNotfiyOrWhatsapp()),
          ],
        ),
      ),
    );
  }
}
