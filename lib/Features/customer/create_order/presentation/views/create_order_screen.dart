import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/components/toast.dart';
import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Features/customer/create_order/presentation/widgets/creat_order_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/components/custom_button.dart';
import '../../../../../Core/constatnts/app_constant.dart';
import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../../../Core/themes/colors/app_colors.dart';
import '../../../../../Core/widgets/loading_page.dart';
import '../../../../../generated/l10n.dart';
import '../controller/order_cubit/order_cubit.dart';
import '../widgets/CustomDropdownButton.dart';

class UserCreateOrderScreen extends StatefulWidget {
  UserCreateOrderScreen({Key? key, this.isQrCode, this.qrCode})
      : super(key: key);

  bool? isQrCode;
  String? qrCode;

  @override
  State<UserCreateOrderScreen> createState() => _UserCreateOrderScreenState();
}

class _UserCreateOrderScreenState extends State<UserCreateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is ErrorAreasOrderState || state is ErrorPagesOrderState) {
          showToast(
              message: S.of(context).network_error, state: ToastState.ERROR);
        }
        if (state is ErrorCreateOrderState) {
          showToast(
              message: S.of(context).network_error, state: ToastState.ERROR);
        }
        if (state is SuccessCreateOrderState) {
          showToast(
              message: S.of(context).order_created, state: ToastState.SUCCESS);
          context.read<OrderCubit>().clearAllValues();
          context.read<OrderCubit>();
          context
              .read<OrderCubit>()
              .fetchPages(id: CacheHelper.getDate(key: AppKeys.userId) ?? 1);
        }
      },
      builder: (context, state) {
        OrderCubit cubit = OrderCubit.get(context);
        if (state is LoadingPagesOrderState) {
          return const LoadingPage();
        } else if (cubit.pagesModel != null) {
          // cubit.extractGovernorate(OrderCubit.get(context).areasModel!);
          cubit.extractProfile(OrderCubit.get(context).pagesModel ?? []);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).create_order,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: context.read<OrderCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).governorateEndregion,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: AppColors.kPrimaryColor,
                            ),
                      ),
                      Spacing.verticalSpace(20),
                      CustomDropdownButton(
                        value: context.read<OrderCubit>().areaDropValue,
                        items: AppFunctions.areaDropDownList,
                        onChanged: (value) {
                          setState(() {
                            context.read<OrderCubit>().areaDropValue = value;
                            print(AppVariables.citiesMap[value]);
                            print(
                                '///////////////////////////////////////$value');
                          });
                          context
                              .read<OrderCubit>()
                              .extractAreaFromGovernorate(value);
                        },
                        hintText: context.read<OrderCubit>().areaDropValue ??
                            S.of(context).choose_area,
                      ),
                      Spacing.verticalSpace(10),
                      CustomDropdownButton(
                        value: context.read<OrderCubit>().areaFromGovDropValue,
                        items: AppFunctions.areaFromGovDropDownList,
                        onChanged: (value) {
                          setState(() {
                            {
                              context.read<OrderCubit>().areaFromGovDropValue =
                                  value;
                              print(AppVariables.areasFromGovMap[value!]);
                            }
                          });
                        },
                        hintText:
                            context.read<OrderCubit>().areaFromGovDropValue ??
                                S.of(context).place,
                      ),
                      Spacing.verticalSpace(10),
                      CustomDropdownButton(
                        value: context.read<OrderCubit>().profileDropValue,
                        items: AppFunctions.profileDropDownList,
                        onChanged: (String? value) {
                          setState(() {
                            context.read<OrderCubit>().profileDropValue = value;
                          });
                          print(AppVariables.profileMap[
                              context.read<OrderCubit>().profileDropValue]);
                        },
                        hintText: context.read<OrderCubit>().profileDropValue ??
                            S.of(context).profile,
                      ),

                      const CreateOrderInput(),
                      //الأختيارين
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: RadioListTile(
                              fillColor:
                                  WidgetStatePropertyAll(MyColors.buttonsColor),
                              hoverColor: MyColors.buttonsColor,
                              activeColor: MyColors.buttonsColor,
                              //tileColor: MyColors.yellowColor,
                              title: Text(
                                S.of(context).money,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w200,
                                    ),
                              ),
                              value: 'اموال',
                              groupValue:
                                  context.read<OrderCubit>().selectedValue,
                              onChanged: (value) {
                                context.read<OrderCubit>().selectedValue =
                                    value!;
                                setState(() {});
                                print(value);
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.47,
                            child: RadioListTile(
                              fillColor:
                                  WidgetStatePropertyAll(MyColors.buttonsColor),
                              activeColor: MyColors.buttonsColor,
                              //tileColor: AppColors.yellowColor,
                              title: Text(
                                S.of(context).commodity,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w200,
                                    ),
                              ),
                              value: 'سلعة',
                              selected: true,
                              autofocus: true,
                              groupValue:
                                  context.read<OrderCubit>().selectedValue,
                              onChanged: (value) {
                                context.read<OrderCubit>().selectedValue =
                                    value!;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      Spacing.verticalSpace(20),

                      state is LoadingCreateOrderState
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: CustomLoadingIndicator(),
                              ),
                            )
                          : Center(
                              child: CustomAppButton(
                                height: 50.h,
                                width: AppConstant.deviceWidth(context) * 0.7,
                                onPressed: () {
                                  if (context
                                              .read<OrderCubit>()
                                              .areaDropValue !=
                                          null &&
                                      context
                                          .read<OrderCubit>()
                                          .formKey
                                          .currentState!
                                          .validate() &&
                                      context
                                              .read<OrderCubit>()
                                              .selectedValue !=
                                          'Option 1') {
                                    if (widget.isQrCode!) {
                                      context
                                          .read<OrderCubit>()
                                          .createOrder(qrCode: widget.qrCode);
                                    } else {
                                      context.read<OrderCubit>().createOrder();
                                    }
                                  } else if (context
                                          .read<OrderCubit>()
                                          .areaDropValue ==
                                      null) {
                                    AppFunctions.showErrorORWarningDialog(
                                        noBtn: '',
                                        fctNO: () {},
                                        context: context,
                                        okBtn: S.of(context).ok,
                                        subtitle: S.of(context).choose_area,
                                        fct: () {});
                                  } else if (context
                                          .read<OrderCubit>()
                                          .selectedValue ==
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
                                text: S.of(context).create_order,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.kWhiteColor,
                                      fontSize: 18.sp,
                                    ),
                              ),
                            ),
                      SizedBox(
                        height: AppConstant.deviceWidth(context) * 0.16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const LoadingPage();
        }
      },
    );
  }
}
