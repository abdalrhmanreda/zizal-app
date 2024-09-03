import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Features/sort_staff/data/repos/sort_staff_repo_imp.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/helpers/service_locator.dart';
import '../../../../config/route_path.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../receiving_representative/home/presentation/views/history_item.dart';
import '../controller/sort_staff_cubit.dart';

class SortHistoryScreen extends StatelessWidget {
  const SortHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SortStaffCubit(getIt<SortStaffRepoImpl>())..getSortHistory(),
      child: BlocConsumer<SortStaffCubit, SortStaffState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! LoadingSortHistoryState,
            builder: (context) => context
                    .read<SortStaffCubit>()
                    .sortHistory
                    .isEmpty
                ? Column(
                    children: [
                      Image.asset(
                        Assets.imagesProductBg,
                        width: AppConstant.deviceWidth(context),
                      ),
                      Spacing.verticalSpace(25),
                      Text(
                        S.of(context).thereNoOrders,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20.sp,
                            ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          print('object');
                          context.navigateToWidgetByNamed(
                            context,
                            RoutePath.orderDetails,
                            arguments: context
                                .read<SortStaffCubit>()
                                .sortHistory[index]
                                .orderNumber,
                          );
                        },
                        child: HistoryItem(
                          barCode: context
                              .read<SortStaffCubit>()
                              .sortHistory[index]
                              .qrcodeNumber!,
                          date: context
                              .read<SortStaffCubit>()
                              .sortHistory[index]
                              .createdAt!,
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemCount:
                          context.read<SortStaffCubit>().sortHistory.length,
                    ),
                  ),
            fallback: (context) => const Center(
              child: CustomLoadingIndicator(),
            ),
          );
        },
      ),
    );
  }
}
