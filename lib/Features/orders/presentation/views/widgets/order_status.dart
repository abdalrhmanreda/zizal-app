import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:alzilzal/config/route_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../generated/l10n.dart';

class OrderStatus extends StatefulWidget {
  final OrderModel orderModel;

  const OrderStatus({super.key, required this.orderModel});

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  bool _isLoading = false;
  late final String? _userRole;

  final statusMapping = const {
    'recorded': 'تم تسجيل الطلب',
    'wrp': 'عند مندوب الإستلام',
    'sorting_agent': 'في موقع الفرز',
    'distribution_agent': 'عند مندوب التوزيع',
    'delivered': 'تم تسليم الطلب',
    'full-return': 'راجع كلى',
    'part-return': 'راجع جزئى',
    'resend': 'إعادة إرسال',
  };

  @override
  void initState() {
    super.initState();
    _userRole = CacheHelper.getDate(key: AppKeys.userRoleKey);
  }

  List<String> getOrderSteps(String status) {
    List<String> steps = [
      'recorded',
      'wrp',
      'sorting_agent',
      'distribution_agent',
    ];

    if (status == 'delivered' ||
        status == 'full-return' ||
        status == 'part-return') {
      steps.add(status);
    } else {
      steps.add('delivered'); // Default to "تم تسليم الطلب"
    }

    return steps;
  }

  int getCurrentStep(String status) {
    List<String> steps = getOrderSteps(status);
    int index = steps.indexOf(status);
    return index >= 0 ? index : steps.length - 1;
  }

  Future<void> _changeOrderStatus(String newStatus) async {
    if (_userRole == 'client_assistant') {
      setState(() {
        _isLoading = true;
      });

      final String url =
          "https://zilzal.pythonanywhere.com/api/v1/orders/${widget.orderModel.orderNumber}/change_status/";

      try {
        final response = await Dio().post(
          url,
          data: {'status': newStatus},
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${CacheHelper.getDate(key: AppKeys.accessTokenKey)}',
            },
          ),
        );

        if (response.statusCode == 200) {
          print('Order status changed to $newStatus');
          setState(() {
            widget.orderModel.status = newStatus;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم تغير حالة الطلب  '),
              backgroundColor: AppColors.kGreenColor,
            ),
          );
          context.navigateAndFinishNyNamed(context, RoutePath.userLayout);
        } else {
          print('Failed to change order status: ${response.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Failed to change order status: ${response.statusCode}')),
          );
        }
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> steps = getOrderSteps(widget.orderModel.status!);
    int currentStep = getCurrentStep(widget.orderModel.status!);

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
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
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
                    ),
                    SizedBox(height: 10.h),
                    if (_userRole == 'client_assistant' &&
                        (widget.orderModel.status == 'part-return' ||
                            widget.orderModel.status == 'full-return'))
                      OutlinedButton(
                        onPressed: () async {
                          if (!_isLoading) {
                            await _changeOrderStatus('resend');
                          }
                        },
                        child: Text(S.of(context).resend),
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
