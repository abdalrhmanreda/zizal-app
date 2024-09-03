import 'package:alzilzal/Features/sending_representative/home/data/models/rep_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/themes/colors/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../controller/sending_rep_orders_cubit.dart';

class OrderStatusSending extends StatelessWidget {
  const OrderStatusSending({Key? key, required this.orderModel})
      : super(key: key);

  final InTheWayOrders orderModel;

  final statusMapping = const {
    'recorded': 'تم تسجيل الطلب',
    'replace': 'استبدال الطلب',
    'part-return': 'راجع جزئى',
    'full-return': 'راجع كلى',
    'wrp': 'عند مندوب الإستلام',
    'delayed': 'مؤجل',
    'change-data': 'تغيير عنوان',
    'in-the-way': 'بالطريق مع المندوب',
    'delivered': 'تم تسليم الطلب',
    'resend': 'اعادة إرسال',
  };

  List<String> getOrderSteps() {
    return [
      'recorded',
      'replace',
      'part-return',
      'full-return',
      'wrp',
      'delayed',
      'change-data',
      'in-the-way',
      'delivered',
      'resend',
    ];
  }

  int getCurrentStep(String status) {
    List<String> steps = getOrderSteps();
    int index = steps.indexOf(status);
    // Ensure index is within bounds
    return index >= 0 && index < steps.length ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendingRepOrdersCubit, SendingRepOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        // Use the updated order model from the state if available
        InTheWayOrders updatedOrderModel = orderModel;
        if (state is ChangeOrderStatusSendingRepOrdersState) {
          updatedOrderModel = state.updatedOrder;
        }

        List<String> steps = getOrderSteps();
        int currentStep = getCurrentStep(updatedOrderModel.status!);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGrayColor.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).order_status,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: AppColors.kGrayColor,
                    ),
              ),
              Stepper(
                physics: const NeverScrollableScrollPhysics(),
                currentStep: currentStep,
                steps: steps.map((statusKey) {
                  return Step(
                    title: Text(statusMapping[statusKey] ?? ''),
                    content: Container(),
                    state: currentStep > steps.indexOf(statusKey)
                        ? StepState.complete
                        : StepState.indexed,
                    isActive: currentStep >= steps.indexOf(statusKey),
                  );
                }).toList(),
                onStepContinue: () {
                  if (currentStep < steps.length - 1) {
                  } else {
                    print('Reached the last step');
                  }
                },
                onStepCancel: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
