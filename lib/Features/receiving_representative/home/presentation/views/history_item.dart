import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/constatnts/colors.dart';
import '../../../../../Core/constatnts/variables.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.barCode,
    required this.date,
  }) : super(key: key);

  final String barCode;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppVariables.appSize(context).width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        //color: Colors.grey[700]!.withOpacity(0.4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppVariables.appSize(context).width * 0.65,
            height: AppVariables.appSize(context).width * 0.25,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: BarcodeWidget(
              data: barCode,
              barcode: Barcode.code128(),
              drawText: false,
            ),
          ),
          Text(
            barCode,
            //S.of(context).On_the_way_with_the_representative,
            style: GoogleFonts.cairo(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: MyColors.buttonsColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            AppFunctions.formatCreateDateAndTime(dateTime: date),
            //S.of(context).On_the_way_with_the_representative,
            style: GoogleFonts.cairo(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
