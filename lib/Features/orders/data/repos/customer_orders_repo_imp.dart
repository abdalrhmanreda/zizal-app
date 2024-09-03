import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../Core/errors/failures.dart';
import '../../../../../../Core/helpers/api_service.dart';
import '../models/order_model.dart';
import 'customer_orders_repo.dart';

class CustomerOrdersRepoImpl implements CustomerOrdersRepo {
  @override
  Future<Either<Failure, List<OrderModel>>> fetchOrdersByStatus({
    required String status,
    required String accessToken,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url: "http://zilzal.pythonanywhere.com/api/v1/orders/?status=$status",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++fetch orders by status get data++++++++++++++");
      print(response.data);
      // If the response data is a list of banners
      final List<dynamic> responseData = response.data;
      final List<OrderModel> ordersStatusList = responseData
          .map((orderData) => OrderModel.fromJson(orderData))
          .toList();
      return right(ordersStatusList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>>
      fetchOrdersByStatusByFollowUpOrClientAssistant(
          {required String status, required String accessToken}) async {
    // TODO: implement fetchOrdersByStatusByFollowUpOrClientAssistant
    try {
      Response response = await DioHelper.getData(
        url:
            "http://zilzal.pythonanywhere.com/api/v1/orders/get_follow_up_and_assistent_orders?status=$status",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++fetch orders by status get data++++++++++++++");
      print(response.data);
      // If the response data is a list of banners
      final List<dynamic> responseData = response.data['orders'];
      final List<OrderModel> ordersStatusList = responseData
          .map((orderData) => OrderModel.fromJson(orderData))
          .toList();
      return right(ordersStatusList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
