import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Features/customer/statstics/presentation/views/widgets/statstics_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/app_constant.dart';
import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../Core/widgets/loading_page.dart';
import '../../../../../generated/l10n.dart';
import '../../../home/presentation/views/orders_with_no_statements_screen.dart';
import '../../data/repos/statstics_repo_imp.dart';
import '../controller/statistics_cubit.dart';

class UserStatisticsScreen extends StatelessWidget {
  const UserStatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit(getIt.get<StatisticsRepoImpl>())
        ..fetchStatisticsData(
          accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
        )
        ..fetchOrdersWithNoStatements(
            client: CacheHelper.getDate(key: AppKeys.userId),
            isStatement: false),
      child: BlocConsumer<StatisticsCubit, StatisticsState>(
        listener: (context, state) {
          if (state is ErrorStatisticsState) {
            customSnackBar(
              context: context,
              text: S.of(context).network_error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          StatisticsCubit cubit = StatisticsCubit.get(context);

          if (cubit.statisticsModel != null) {
            List<StatisticsModel> statisticsList = [
              StatisticsModel(
                  number: cubit.orderWithNoStatementsList.length.toInt(),
                  title: S.of(context).orders_with_no_statements),
              StatisticsModel(
                number: cubit.statisticsModel!.orders,
                title: S.of(context).orders_number,
              ),
              StatisticsModel(
                number: cubit.statisticsModel!.totalAmount ?? 0,
                title: S.of(context).total_prices,
              ),
            ];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Define your onTap action here
                          AppFunctions.pushTo(
                            context: context,
                            screen: OrdersWithNoStatementsScreen(
                              ordersList: cubit.orderWithNoStatementsList,
                            ),
                          );
                        },
                        child: StatsticsItem(
                          width: AppConstant.deviceWidth(context) / 2.3,
                          number: statisticsList[0].number,
                          title: statisticsList[0].title,
                        ),
                      ),
                      Spacing.horizontalSpace(10),
                      StatsticsItem(
                        width: AppConstant.deviceWidth(context) / 2.3,
                        number: statisticsList[1].number,
                        title: statisticsList[1].title,
                      ),
                    ],
                  ),
                  Spacing.verticalSpace(20),
                  StatsticsItem(
                    width: AppConstant.deviceWidth(context),
                    number: statisticsList[2].number,
                    title: statisticsList[2].title,
                  ),
                ],
              ),
            );
          } else {
            return const LoadingPage();
          }
        },
      ),
    );
  }
}

class StatisticsModel {
  final num number;
  final String title;
  StatisticsModel({required this.number, required this.title});
}
