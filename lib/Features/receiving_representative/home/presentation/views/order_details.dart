import 'package:alzilzal/Core/components/custom_button.dart';
import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/components/toast.dart';
import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Features/receiving_representative/home/presentation/controller/receiving_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../../sort_staff/presentation/views/widgets/custom_dropdown.dart';
import '../../data/repos/receiving_repo_imp.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key, required this.orderNumber}) : super(key: key);
  final int orderNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).order_details), // Use localized string
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => ReceivingCubit(getIt.get<ReceivingRepoImpl>())
          ..getOrderDetails(orderNumber)
          ..getDistributionRepresentative(orderNumber: orderNumber),
        child: BlocConsumer<ReceivingCubit, ReceivingState>(
          listener: (context, state) {
            // Implement listener if needed
          },
          builder: (context, state) {
            ReceivingCubit cubit = ReceivingCubit.get(context);

            // Debug print to check the current state
            print('Current state: $state');

            return ConditionalBuilder(
              condition: cubit.orderDetails != null,
              builder: (context) {
                print('Condition is true, displaying history list');
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .order_number), // Use localized string
                              subtitle: Text(
                                  cubit.orderDetails!.orderNumber.toString()),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .customer), // Use localized string
                              subtitle: Text(cubit.orderDetails!.customer!),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .customer_number), // Use localized string
                              subtitle:
                                  Text(cubit.orderDetails!.customerNumber!),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .address), // Use localized string
                              subtitle: Text(cubit.orderDetails!.address!),
                            ),
                            ListTile(
                              title: Text(
                                  S.of(context).type), // Use localized string
                              subtitle: Text(cubit.orderDetails!.type!),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .nearest_point), // Use localized string
                              subtitle: Text(cubit.orderDetails!.nearestPoint!),
                            ),
                            ListTile(
                              title: Text(
                                  S.of(context).status), // Use localized string
                              subtitle: Text(cubit.orderDetails!.status!),
                            ),
                            ListTile(
                              title: Text(
                                  S.of(context).notes), // Use localized string
                              subtitle: Text(cubit.orderDetails!.notes!),
                            ),
                            ListTile(
                              title: Text(
                                  S.of(context).count), // Use localized string
                              subtitle:
                                  Text(cubit.orderDetails!.count.toString()),
                            ),
                            ListTile(
                              title: Text(
                                  S.of(context).amount), // Use localized string
                              subtitle: Text(cubit.orderDetails!.amount!),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .amount_type), // Use localized string
                              subtitle: Text(cubit.orderDetails!.amountType!),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .received_amount), // Use localized string
                              subtitle:
                                  Text(cubit.orderDetails!.recievedAmount!),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .delivery_amount), // Use localized string
                              subtitle:
                                  Text(cubit.orderDetails!.deliveryAmount!),
                            ),
                            ListTile(
                              title: Text(S
                                  .of(context)
                                  .client_amount), // Use localized string
                              subtitle: Text(cubit.orderDetails!.clientAmount!),
                            ),
                            ListTile(
                              title: Text(
                                  S.of(context).page), // Use localized string
                              subtitle:
                                  Text(cubit.orderDetails!.page.toString()),
                            ),
                            ListTile(
                              title: Text(
                                  S.of(context).area), // Use localized string
                              subtitle:
                                  Text(cubit.orderDetails!.area.toString()),
                            ),
                            if (cubit.orderDetails!.status ==
                                'waiting_distribution')
                              Column(
                                children: [
                                  CustomDropdown(
                                    hint: cubit.distributionRepresentativeModel !=
                                            null
                                        ? cubit.distributionRepresentativeModel!
                                            .fullName!
                                        : S
                                            .of(context)
                                            .choose_distribution_representative,
                                    items: cubit.distributionRepresentativeLst,
                                    onChanged: (p0) {
                                      cubit.distributionRepresentativeModel =
                                          p0;
                                    },
                                  ),
                                  BlocConsumer<ReceivingCubit, ReceivingState>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                      if (state
                                          is AppointDistributionRepresentativeSuccessState) {
                                        showToast(
                                            message: state.message,
                                            state: ToastState.SUCCESS);
                                      }
                                    },
                                    builder: (context, state) {
                                      return CustomAppButton(
                                        onPressed: () {
                                          // Implement the appointment logic
                                          cubit.appointDistributionRepresentative(
                                              orderNumber: orderNumber,
                                              distributorId: cubit
                                                  .distributionRepresentativeModel!
                                                  .id!);
                                        },
                                        width:
                                            AppConstant.deviceWidth(context) *
                                                0.8,
                                        text: S.of(context).appoint,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            Spacing.verticalSpace(20),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              fallback: (context) {
                print('Condition is false, displaying loading indicator');
                return const Center(
                  child: CustomLoadingIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
