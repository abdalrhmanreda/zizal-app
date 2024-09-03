import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Features/sending_representative/home/presentation/views/orders_by_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../Core/widgets/status_order_item.dart';
import '../../../../../generated/l10n.dart';
import '../../data/repos/sending_rep_home_repo_imp.dart';
import '../controller/sending_rep_home_cubit.dart';

class SendingRepHomeScreen extends StatelessWidget {
  const SendingRepHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SendingRepHomeCubit(getIt.get<SendingRepHomeRepoImpl>())
            ..fetchOrders(context),
      child: BlocConsumer<SendingRepHomeCubit, SendingRepHomeState>(
        listener: (context, state) {
          if (state is ErrorOrdersSendingRepHomeState) {
            customSnackBar(
              context: context,
              text: S.of(context).network_error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          SendingRepHomeCubit cubit = SendingRepHomeCubit.get(context);
          Future refresh() async {
            cubit.fetchOrders(context);
          }

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: RefreshIndicator(
              onRefresh: refresh,
              color: MyColors.goldenColor,
              child: state is LoadingOrdersSendingRepHomeState
                  ? const Center(child: CustomLoadingIndicator())
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: cubit.ordersNumbersList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          AppFunctions.pushTo(
                            context: context,
                            screen: OrdersByStatusScreen(
                              title: cubit.titles(context)[index],
                              ordersList: index == 0
                                  ? cubit.ordersModel?.inTheWayOrders ?? []
                                  : index == 1
                                      ? cubit.ordersModel?.resendOrders ?? []
                                      : index == 2
                                          ? cubit.ordersModel
                                                  ?.deliveredOrders ??
                                              []
                                          : index == 3
                                              ? cubit.ordersModel
                                                      ?.replaceOrders ??
                                                  []
                                              : index == 4
                                                  ? cubit.ordersModel
                                                          ?.inprogress ??
                                                      []
                                                  : index == 5
                                                      ? cubit.ordersModel
                                                              ?.delayedOrders ??
                                                          []
                                                      : index == 6
                                                          ? cubit.ordersModel
                                                                  ?.partReturnOrders ??
                                                              []
                                                          : cubit.ordersModel
                                                                  ?.fullReturnOrders ??
                                                              [],
                            ),
                          );
                        },
                        child: StatusOrderItem(
                          title: cubit.titles(context)[index],
                          image: cubit.images[index],
                          num: cubit.ordersNumbersList[index].toString(),
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
