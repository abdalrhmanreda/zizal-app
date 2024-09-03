import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../data/models/rep_orders_model.dart';
import '../../data/repos/sending_rep_home_repo.dart';

part 'sending_rep_home_state.dart';

class SendingRepHomeCubit extends Cubit<SendingRepHomeState> {
  SendingRepHomeCubit(this.customerRepo) : super(SendingRepHomeInitialState());

  static SendingRepHomeCubit get(context) => BlocProvider.of(context);
  final SendingRepHomeRepo customerRepo;

  List<int> ordersNumbersList = [];
  RepOrdersModel? ordersModel;

  Future<void> fetchOrders(context) async {
    emit(LoadingOrdersSendingRepHomeState());
    try {
      await customerRepo
          .fetchOrders(
              accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey))
          .then((value) {
        value.fold(
          (l) {
            print(l.message);
            emit(ErrorOrdersSendingRepHomeState());
          },
          (r) {
            ordersNumbersList.add(r.inTheWayOrdersLength ?? 0);
            ordersNumbersList.add(r.resendOrdersLength ?? 0);
            ordersNumbersList.add(r.deliveredOrdersLength ?? 0);
            ordersNumbersList.add(r.replaceOrdersLength ?? 0);
            ordersNumbersList.add(r.inprogressLength ?? 0);
            ordersNumbersList.add(r.delayedOrdersLength ?? 0);
            ordersNumbersList.add(r.partReturnOrdersLength ?? 0);
            ordersNumbersList.add(r.fullReturnOrdersLength ?? 0);

            ordersModel = r;
            emit(SuccessOrdersSendingRepHomeState());
          },
        );
      });
    } catch (e) {
      print(e);
      emit(ErrorOrdersSendingRepHomeState());
    }
  }

  List<String> titles(context) => [
        S.of(context).on_the_way_with_delegate,
        S.of(context).resend,
        S.of(context).delivered,
        S.of(context).replacement,
        S.of(context).processing,
        S.of(context).postponed,
        S.of(context).partial_return,
        S.of(context).total_return,
      ];
  List<String> images = [
    Assets.iconsCargoTruck,
    Assets.iconsResend,
    Assets.iconsWallet,
    Assets.iconsArrow,
    Assets.iconsSynergy,
    Assets.iconsDelayed,
    Assets.imagesBox,
    Assets.imagesBox,
  ];
}
