import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../orders/data/models/order_model.dart';
import '../../../home/data/models/rep_orders_model.dart';
import '../../data/repos/sending_rep_orders_repo.dart';

part 'SendingRep_orders_state.dart';

class SendingRepOrdersCubit extends Cubit<SendingRepOrdersState> {
  SendingRepOrdersCubit(this.customerRepo)
      : super(SendingRepOrdersInitialState());

  static SendingRepOrdersCubit get(context) => BlocProvider.of(context);
  final SendingRepOrdersRepo customerRepo;

  List<OrderModel> ordersList = [];

  Future<void> fetchOrdersByStatus({
    required String status,
    required String accessToken,
  }) async {
    ordersList = [];
    emit(LoadingOrdersSendingRepOrdersState());
    var result = await customerRepo.fetchOrdersByStatus(
        status: status, accessToken: accessToken);
    result.fold((failure) {
      emit(ErrorOrdersSendingRepOrdersState());
    }, (value) {
      ordersList = value;
      print(value);
      emit(SuccessOrdersSendingRepOrdersState());
    });
  }
}
