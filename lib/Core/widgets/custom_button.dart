import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.fnc,
      required this.child,
      required this.w,
      required this.h})
      : super(key: key);

  final Widget child;
  final double w;
  final double h;
  final VoidCallback fnc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * w,
      child: MaterialButton(
        height: MediaQuery.of(context).size.width * h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: fnc,
        color: MyColors.goldenColor, //Colors.blue[300],
        child: child,
      ),
    );
  }
}
