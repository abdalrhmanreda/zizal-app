import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/components/toast.dart';
import 'package:alzilzal/Core/constatnts/api_const.dart';
import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Core/widgets/loading_page.dart';
import 'package:alzilzal/Features/customer/create_order/presentation/controller/order_cubit/order_cubit.dart';
import 'package:alzilzal/config/route_path.dart';
import 'package:alzilzal/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../layout/presentation/views/customer_layout_screen.dart';
import '../../data/repos/order_repo_imp.dart';

class ChooseScreenNotfiyOrWhatsapp extends StatelessWidget {
  const ChooseScreenNotfiyOrWhatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(getIt.get<OrderRepoImpl>()),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is ErrorGetPhoneState || state is ErrorSendNotOrderState) {
            showToast(
                message: S.of(context).network_error, state: ToastState.ERROR);
          } else if (state is SuccessSendNotOrderState) {
            showToast(
                message: 'Notification sent successfully',
                state: ToastState.SUCCESS);
            context.navigateToWidget(context, const UserLayoutScreen());
          } else if (state is SuccessGetPhoneState) {
            context.navigateToWidget(context, const UserLayoutScreen());
          }

          // TODO: implement listener
        },
        builder: (context, state) {
          return state is LoadingGetPhoneState
              ? const LoadingPage()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      Assets.imagesDeliveryRemovebgPreview,
                      width: 200.w,
                      height: 200.h,
                    ),
                    Spacing.verticalSpace(20.h),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: AppConstant.deviceWidth(context),
                      ),
                      child: Text(
                        S.of(context).receiveMethod,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Spacing.verticalSpace(40.h),
                    GestureDetector(
                      onTap: () async {
                        // NotificationCubit.get(context).sendNotification();
                        String phone =
                            await context.read<OrderCubit>().getPhone();
                        Uri url = Uri.parse('${ApiConst.whatsappUrl}$phone');
                        await launchUrl(url);
                      },
                      child: Container(
                        width: AppConstant.deviceWidth(context) * 0.8,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.kPrimaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Bootstrap.whatsapp,
                              color: AppColors.kWhiteColor,
                            ),
                            Spacing.horizontalSpace(15.w),
                            Text(
                              S.of(context).sendMessageWhatsApp,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.kWhiteColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacing.verticalSpace(20.h),
                    state is LoadingSendNotOrderState
                        ? const CustomLoadingIndicator()
                        : GestureDetector(
                            onTap: () {
                              // NotificationCubit.get(context).sendNotification();
                              context.read<OrderCubit>().sendNotification();
                            },
                            child: Container(
                              width: AppConstant.deviceWidth(context) * 0.8,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.kPrimaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    IconlyBroken.notification,
                                    color: AppColors.kWhiteColor,
                                  ),
                                  Spacing.horizontalSpace(10.w),
                                  Text(
                                    S.of(context).sendNotification,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 16.sp,
                                          color: AppColors.kWhiteColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    Spacing.verticalSpace(20.h),
                    TextButton(
                      onPressed: () {
                        context.navigateToWidgetByNamed(
                            context, RoutePath.createOrderScreen);
                      },
                      child: Text(
                        S.of(context).addNewOrder,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 17.sp,
                              color: AppColors.kBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
