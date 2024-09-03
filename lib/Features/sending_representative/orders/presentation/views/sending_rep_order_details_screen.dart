import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Core/widgets/custom_button.dart';
import 'package:alzilzal/Features/sending_representative/home/data/models/rep_orders_model.dart';
import 'package:alzilzal/Features/sending_representative/orders/presentation/views/widgets/client_info_sending.dart';
import 'package:alzilzal/Features/sending_representative/orders/presentation/views/widgets/order_info_sending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/spacing.dart';
import '../../../../../Core/themes/colors/app_colors.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../layout/presentation/views/sending_rep_layout_screen.dart';
import '../../data/repos/sending_rep_orders_repo_imp.dart';

class SendingRepOrderDetailsScreen extends StatefulWidget {
  const SendingRepOrderDetailsScreen({Key? key, required this.order})
      : super(key: key);
  final InTheWayOrders order;

  @override
  State<SendingRepOrderDetailsScreen> createState() =>
      _SendingRepOrderDetailsScreenState();
}

class _SendingRepOrderDetailsScreenState
    extends State<SendingRepOrderDetailsScreen> {
  int _currentStep = 0;
  bool isLoading = false;
  final Map<int, bool> stepStatus = {
    for (var item in List.generate(8, (index) => index)) item: false
  };

  @override
  void initState() {
    super.initState();
    setUpStepper();
  }

  void setUpStepper() {
    for (int i = 0; i < 8; i++) {
      if (widget.order.status ==
          AppVariables.orderStatusListSending(context)[i]) {
        setState(() {
          stepStatus[i] = true;
        });
      }
    }
  }

  Future<void> changeStatus({
    required String status,
    required String orderId,
  }) async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await SendingRepOrdersRepoImpl()
          .changeOrderStatus(orderId: orderId, status: status);
      result.fold(
        (failure) {
          customSnackBar(
            context: context,
            text: S.of(context).network_error,
            color: Colors.red,
          );
        },
        (success) {
          customSnackBar(
            context: context,
            text: S.of(context).ok,
            color: Colors.green,
          );
          context.navigateToWidget(context, const SendingRepLayoutScreen());
        },
      );
    } catch (error) {
      customSnackBar(
        context: context,
        text: S.of(context).network_error,
        color: Colors.red,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).order,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.kGrayColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '#${widget.order.orderNumber}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClientInfoSending(orderModel: widget.order),
              Spacing.verticalSpace(10),
              OrderInfoSending(orderModel: widget.order),
              Spacing.verticalSpace(15),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 10.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      S.of(context).order_status,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                    ),
                    Stepper(
                      physics: const NeverScrollableScrollPhysics(),
                      connectorThickness: 0,
                      margin: const EdgeInsets.all(10),
                      steps: List.generate(
                          8, (index) => _buildStep(context, index)),
                      onStepTapped: (int newIndex) {
                        setState(() {
                          _currentStep = newIndex;
                        });
                      },
                      currentStep: _currentStep,
                      type: StepperType.vertical,
                      controlsBuilder: (context, details) => Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Step _buildStep(BuildContext context, int stepIndex) {
    return Step(
      title:
          Text(AppVariables.orderTitlesStatusListSending(context)[stepIndex]),
      isActive: stepStatus[stepIndex]!,
      state: stepStatus[stepIndex]! ? StepState.complete : StepState.indexed,
      content: stepStatus[stepIndex]!
          ? Text(
              S.of(context).status_activated,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: MyColors.buttonsColor,
                    fontSize: 18,
                  ),
            )
          : CustomButton(
              fnc: () {
                setState(() {
                  stepStatus[stepIndex] = true;
                });
                changeStatus(
                  status:
                      AppVariables.orderStatusListSending(context)[stepIndex],
                  orderId: widget.order.orderNumber.toString(),
                );
              },
              w: 0.4,
              h: 0.1,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      S.of(context).active_status,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                    ),
            ),
    );
  }
}
