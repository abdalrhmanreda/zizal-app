import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../Core/constatnts/colors.dart';
import '../../../../../../Core/constatnts/variables.dart';

class RowOfDetailsData extends StatelessWidget {
  const RowOfDetailsData({Key? key, required this.type, required this.data})
      : super(key: key);

  final String type;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: AppVariables.appSize(context).width * 0.25,
          child: Text(
            type,
            textAlign: TextAlign.start,
            style: GoogleFonts.cairo(
              color: Colors.grey,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          width: AppVariables.appSize(context).width * 0.6,
          child: Text(
            data,
            textAlign: TextAlign.start,
            style: GoogleFonts.cairo(
              color: MyColors.buttonsColor,
              fontWeight: FontWeight.w900,
              fontSize: 17,
            ),
            //Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
