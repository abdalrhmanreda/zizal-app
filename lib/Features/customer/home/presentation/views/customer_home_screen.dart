import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Features/customer/home/presentation/views/widgets/banner_widget.dart';
import 'package:alzilzal/Features/customer/home/presentation/views/widgets/icons.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/constatnts/spacing.dart';
import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../Core/widgets/status_order_item.dart';
import '../../../../../generated/l10n.dart';
import '../../data/repos/customer_home_repo_imp.dart';
import '../controller/customer_home_cubit.dart';
import 'orders_by_status_screen.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerHomeCubit(getIt.get<CustomerHomeRepoImpl>())
        ..fetchBanners()
        ..fetchOrdersNumbers(context),
      child: BlocConsumer<CustomerHomeCubit, CustomerHomeState>(
        listener: (context, state) {
          if (state is ErrorBannersCustomerHomeState) {
            customSnackBar(
              context: context,
              text: S.of(context).network_error,
              color: Colors.red,
            );
          }
          if (state is ErrorOrdersCustomerHomeState ||
              state is ErrorOrdersWithNoStatementCustomerHomeState) {
            customSnackBar(
              context: context,
              text: S.of(context).network_error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          CustomerHomeCubit cubit = CustomerHomeCubit.get(context);
          Future refresh() async {
            cubit.fetchBanners();
            cubit.fetchOrdersNumbers(context);
          }

          return RefreshIndicator(
            onRefresh: refresh,
            color: MyColors.goldenColor,
            child: ConditionalBuilder(
              condition: cubit.banners.isNotEmpty &&
                  cubit.ordersNumbersList.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BannerWidget(
                        banners: cubit.banners,
                      ),
                      Spacing.verticalSpace(20),
                      Column(
                        children: [
                          buildOrderStatusRow(context, cubit, 0, 1),
                          Spacing.verticalSpace(20),
                          InkWell(
                            onTap: () {
                              AppFunctions.pushTo(
                                context: context,
                                screen: OrdersByStatusScreen(
                                    status: AppVariables.orderStatusList(
                                        context)[3],
                                    title: AppVariables.orderTitlesStatusList(
                                        context)[3]),
                              );
                            },
                            child: StatusOrderItem(
                              width: AppConstant.deviceWidth(context) * .88,
                              title: AppVariables.orderTitlesStatusList(
                                  context)[3],
                              image: iconsImages[3],
                              num: cubit.ordersNumbersList[
                                      AppVariables.orderStatusList(context)[3]]
                                  .toString(),
                            ),
                          ),
                          Spacing.verticalSpace(10),
                          buildOrderStatusRow(context, cubit, 4, 5),
                          Spacing.verticalSpace(10),
                          buildOrderStatusRow(context, cubit, 6, 7),
                          Spacing.verticalSpace(10),
                          buildOrderStatusRow(context, cubit, 8, 9),
                          Spacing.verticalSpace(10),
                          buildOrderStatusRow(context, cubit, 10, 2),
                          Spacing.verticalSpace(60),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context) => const Center(
                child: CustomLoadingIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildOrderStatusRow(BuildContext context, CustomerHomeCubit cubit,
      int firstIndex, int secondIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildOrderStatusItem(context, cubit, firstIndex),
        Spacing.horizontalSpace(10),
        buildOrderStatusItem(context, cubit, secondIndex),
      ],
    );
  }

  Widget buildOrderStatusItem(
      BuildContext context, CustomerHomeCubit cubit, int index) {
    return InkWell(
      onTap: () {
        AppFunctions.pushTo(
          context: context,
          screen: OrdersByStatusScreen(
              status: AppVariables.orderStatusList(context)[index],
              title: AppVariables.orderTitlesStatusList(context)[index]),
        );
      },
      child: StatusOrderItem(
        width: AppConstant.deviceWidth(context) * .4,
        title: AppVariables.orderTitlesStatusList(context)[index],
        image: iconsImages[index],
        num: cubit
            .ordersNumbersList[AppVariables.orderStatusList(context)[index]]
            .toString(),
      ),
    );
  }
}
