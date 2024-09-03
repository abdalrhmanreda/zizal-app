import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Core/widgets/loading_page.dart';
import 'package:alzilzal/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/helpers/service_locator.dart';
import '../../../../../../generated/l10n.dart';
import '../../../customer/home/presentation/views/orders_with_no_statements_screen.dart';
import '../../data/repos/customer_orders_repo_imp.dart';
import '../controller/customer_orders_cubit.dart';

class UserOrdersScreen extends StatelessWidget {
  const UserOrdersScreen({Key? key, required this.status}) : super(key: key);

  final String status;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerOrdersCubit(getIt.get<CustomerOrdersRepoImpl>())
            ..fetchOrdersByStatus(
              status: status,
              accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
            ),
      child: BlocConsumer<CustomerOrdersCubit, CustomerOrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          CustomerOrdersCubit cubit = CustomerOrdersCubit.get(context);
          if (cubit.ordersList.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                children: [
                  if (cubit.ordersList.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => OrderItem(
                          orderModel: cubit.ordersList[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: cubit.ordersList.length,
                      ),
                    ),
                  if (state is LoadingOrdersCustomerOrdersState)
                    Center(
                      child: CircularProgressIndicator(
                        color: MyColors.buttonsColor,
                      ),
                    )
                ],
              ),
            );
          } else if (state is LoadingOrdersCustomerOrdersState) {
            return const LoadingPage();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: AppVariables.appSize(context).width / 2,
                    height: 200.h,
                    child: Image.asset(
                      color: AppColors.kPrimaryColor,
                      Assets.imagesBox,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacing.verticalSpace(20),
                  Text(
                    S.of(context).no_orders_yet,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
