import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/components/custom_button.dart';
import '../../../../../Core/constatnts/app_constant.dart';
import '../../../../../Core/themes/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../controller/order_cubit/order_cubit.dart';

class CreateOrderButtons extends StatelessWidget {
  const CreateOrderButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomAppButton(
        height: 50.h,
        width: AppConstant.deviceWidth(context) * 0.7,
        onPressed: () {
          if (context.read<OrderCubit>().areaDropValue != null &&
              context.read<OrderCubit>().formKey.currentState!.validate() &&
              context.read<OrderCubit>().selectedValue != 'Option 1') {
            context.read<OrderCubit>().createOrder();

            // context.navigateToWidgetByNamed(context,
            //     RoutePath.chooseScreenQrCodeOrNot);
          } else if (context.read<OrderCubit>().areaDropValue == null) {
            AppFunctions.showErrorORWarningDialog(
                noBtn: '',
                fctNO: () {},
                context: context,
                okBtn: S.of(context).ok,
                subtitle: S.of(context).choose_area,
                fct: () {});
          }
          // else if (profileDropValue == null) {
          //   AppFunctions.showErrorORWarningDialog(
          //       noBtn: '',
          //       fctNO: () {},
          //       context: context,
          //       okBtn: S.of(context).ok,
          //       subtitle: S.of(context).choose_area,
          //       fct: () {});
          // }
          else if (context.read<OrderCubit>().selectedValue == 'Option 1') {
            AppFunctions.showErrorORWarningDialog(
                noBtn: '',
                fctNO: () {},
                context: context,
                okBtn: S.of(context).ok,
                subtitle: S.of(context).empty_field,
                fct: () {});
          }
        },
        text: S.of(context).create_order,
        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.kBlackColor,
              fontSize: 18.sp,
            ),
      ),
    );
  }
}

/*
*    Center(
          child: CustomAppButton(
            height: 50.h,
            width: AppConstant.deviceWidth(context) * 0.7,
            onPressed: () {
              if (context.read<OrderCubit>().areaDropValue != null &&
                  context.read<OrderCubit>().formKey.currentState!.validate() &&
                  context.read<OrderCubit>().selectedValue != 'Option 1') {
                showQRCodeScannerDialog(context, onCodeScanned: (code) {
                  context.read<OrderCubit>().createOrder(qrCode: code);
                  print('***********************************$code');
                  context.read<OrderCubit>().qrCode = code;
                  print(
                      '***********************************${context.read<OrderCubit>().qrCode}');
                });
                // context.navigateToWidgetByNamed(context,
                //     RoutePath.chooseScreenQrCodeOrNot);
              } else if (context.read<OrderCubit>().areaDropValue == null) {
                AppFunctions.showErrorORWarningDialog(
                    noBtn: '',
                    fctNO: () {},
                    context: context,
                    okBtn: S.of(context).ok,
                    subtitle: S.of(context).choose_area,
                    fct: () {});
              } else if (context.read<OrderCubit>().selectedValue ==
                  'Option 1') {
                AppFunctions.showErrorORWarningDialog(
                    noBtn: '',
                    fctNO: () {},
                    context: context,
                    okBtn: S.of(context).ok,
                    subtitle: S.of(context).empty_field,
                    fct: () {});
              }
            },
            text: S.of(context).generateQR,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kBlackColor,
                  fontSize: 18.sp,
                ),
          ),
        ),
* */
