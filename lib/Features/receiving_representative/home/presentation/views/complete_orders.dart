import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Features/receiving_representative/home/presentation/controller/receiving_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/constatnts/assets_manager.dart';
import '../../../../../Core/constatnts/colors.dart';
import '../../../../../Core/constatnts/variables.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../Core/widgets/loading_page.dart';
import '../../../../../config/route_path.dart';
import '../../../../../generated/l10n.dart';
import '../../data/repos/receiving_repo_imp.dart';
import 'history_item.dart';

class CompleteOrdersScreen extends StatelessWidget {
  const CompleteOrdersScreen({super.key});
  Future refresh() async {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReceivingCubit(getIt.get<ReceivingRepoImpl>())
        ..fetchHistory(
          recieverId: CacheHelper.getDate(key: AppKeys.userId) ?? 5,
          reset: false,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).compeleteOrders),
        ),
        body: BlocConsumer<ReceivingCubit, ReceivingState>(
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
          if (cubit.historyLst.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      color: MyColors.goldenColor,
                      child: ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print('object');
                            context.navigateToWidgetByNamed(
                              context,
                              RoutePath.orderDetails,
                              arguments: cubit.historyLst[index].orderNumber,
                            );
                          },
                          child: HistoryItem(
                            barCode: cubit.historyLst[index].qrcodeNumber!,
                            date: cubit.historyLst[index].createdAt!,
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: cubit.historyLst.length,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is LoadingFetchHistoryReceivingState) {
            return const LoadingPage();
          } else {
            return Column(
              children: [
                Container(
                  width: AppVariables.appSize(context).width,
                  height: AppVariables.appSize(context).width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsManager.productBg),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  S.of(context).no_orders_yet,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
