import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../Core/constatnts/colors.dart';
import '../../../../../../Core/constatnts/variables.dart';

class RowOfDetailsData2 extends StatelessWidget {
  const RowOfDetailsData2(
      {Key? key,
      required this.value2,
      required this.value1,
      required this.title1,
      required this.title2})
      : super(key: key);

  final String value1;
  final String value2;
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: AppVariables.appSize(context).width * 0.35,
          child: Column(
            children: [
              Text(
                title1,
                textAlign: TextAlign.start,
                style: GoogleFonts.cairo(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
              Text(
                value1,
                textAlign: TextAlign.start,
                style: GoogleFonts.cairo(
                  color: MyColors.buttonsColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 1,
          height: 50,
          color: Colors.grey,
        ),
        SizedBox(
          width: AppVariables.appSize(context).width * 0.55,
          child: Column(
            children: [
              Text(
                title2,
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
              Text(
                value2,
                textAlign: TextAlign.start,
                style: GoogleFonts.cairo(
                  color: MyColors.buttonsColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
