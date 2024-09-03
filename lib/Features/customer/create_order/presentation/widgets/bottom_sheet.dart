import 'package:alzilzal/Core/components/custom_button.dart';
import 'package:alzilzal/Features/customer/create_order/presentation/views/choose_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

void showChooseBottomSheet(context, VoidCallback onSend) {
  showModalBottomSheet(
    isScrollControlled: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15), // Adjust the radius as needed
      ),
    ),
    context: context,
    builder: (context) => Column(
      children: [
        SizedBox(
          height: 300.h,
          child: const ChooseScreenNotfiyOrWhatsapp(),
        ),
        CustomAppButton(
          width: 100.w,
          onPressed: () {
            Navigator.pop(context);
            onSend();
          },
          text: S.of(context).ok,
        ),
      ],
    ),
  );
}
