import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Core/widgets/loading_page.dart';
import 'package:alzilzal/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../config/route_path.dart';
import '../../../../../generated/l10n.dart';
import '../../data/repos/receiving_repo_imp.dart';
import '../controller/receiving_cubit.dart';

class ReceivingHistoryScreen extends StatelessWidget {
  const ReceivingHistoryScreen({Key? key}) : super(key: key);

  Future refresh() async {}
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReceivingCubit(getIt.get<ReceivingRepoImpl>())
        ..fetchHistory(
          recieverId: CacheHelper.getDate(key: AppKeys.userId) ?? 5,
          reset: false,
        ),
      child: BlocConsumer<ReceivingCubit, ReceivingState>(
          listener: (context, state) {
        if (state is ErrorFetchHistoryReceivingState) {
          customSnackBar(
            context: context,
            text: S.of(context).network_error,
            color: Colors.red,
          );
        }
      }, builder: (context, state) {
        ReceivingCubit cubit = ReceivingCubit.get(context);
        if (state is LoadingFetchHistoryReceivingState) {
          return const LoadingPage();
        } else {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.navigateToWidgetByNamed(
                      context, RoutePath.completeOrderScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 10.w,
                  ),
                  width: AppConstant.deviceWidth(context),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kGrayColor.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          Assets.iconsShoppingBag,
                          height: 80.h,
                        ),
                        Text(
                          S.of(context).compeleteOrders,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '${cubit.historyLst.length}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
