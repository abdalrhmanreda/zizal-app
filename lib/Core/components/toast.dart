import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { SUCCESS, ERROR, WARNING }

void showToast({
  required String message,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: stateColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

Color stateColor(ToastState state) {
  Color? color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
//
//
// void showToast({
//   required String message ,
//   required ToastStates state
//
// })=>  Fluttertoast.showToast(
//     msg:message ,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor:ChooseToastColor(state),
//     textColor: Colors.white,
//     fontSize: 16.0
// )  ;
//
// enum ToastStates {success , warning , error}
//
// Color ChooseToastColor(ToastStates state)
// {
//     Color color  ;
//   switch (state)
//   {
//     case ToastStates.success :
//       color= Colors.green ;
//       break ;
//       case ToastStates.warning :
//         color= Colors.amber ;
//         break ;
//     case ToastStates.error :
//       color= Colors.red  ;
//       break ;
//   }
//   return color ;
//   }
