import 'package:flutter/material.dart';

class AppConstant {
  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isQrCode = false;
}
