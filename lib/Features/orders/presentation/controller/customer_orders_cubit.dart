import 'package:alzilzal/Core/helpers/api_service.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Core/constatnts/app_keys.dart';
import '../../data/models/order_model.dart';
import '../../data/repos/customer_orders_repo.dart';

part 'customer_orders_state.dart';

class CustomerOrdersCubit extends Cubit<CustomerOrdersState> {
  CustomerOrdersCubit(this.customerRepo) : super(CustomerOrdersInitialState());

  static CustomerOrdersCubit get(context) => BlocProvider.of(context);
  final CustomerOrdersRepo customerRepo;

  List<OrderModel> ordersList = [];

  Future<void> fetchOrdersByStatus({
    required String status,
    required String accessToken,
  }) async {
    if (CacheHelper.getDate(key: 'role') == 'client') {
      emit(LoadingOrdersCustomerOrdersState());
      var result = await customerRepo.fetchOrdersByStatus(
          status: status, accessToken: accessToken);
      result.fold((failure) {
        emit(ErrorOrdersCustomerOrdersState());
      }, (value) {
        ordersList = value;
        print(value);
        emit(SuccessOrdersCustomerOrdersState());
      });
    } else {
      emit(LoadingOrdersCustomerOrdersState());
      var result =
          await customerRepo.fetchOrdersByStatusByFollowUpOrClientAssistant(
              status: status, accessToken: accessToken);
      result.fold((failure) {
        emit(ErrorOrdersCustomerOrdersState());
      }, (value) {
        ordersList = value;
        print(value);
        emit(SuccessOrdersCustomerOrdersState());
      });
    }
  }

  void changeOrderStatus({
    required String orderId,
    required String status,
  }) async {
    emit(LoadingOrdersCustomerOrdersState());
    DioHelper.postData(
      url:
          "https://zilzal.pythonanywhere.com/api/v1/orders/$orderId/change_status/",
      data: {
        'status': status,
      },
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${CacheHelper.getDate(key: AppKeys.accessTokenKey)}',
        },
      ),
    ).then((value) {
      print("+++++++++++++change order status post data++++++++++++++");
      print(value.data);
      emit(SuccessOrdersCustomerOrdersState());
    }).catchError((error) {
      print("e.toString()------------");
      print(error.toString());
      emit(ErrorOrdersCustomerOrdersState());
    });
  }
}
