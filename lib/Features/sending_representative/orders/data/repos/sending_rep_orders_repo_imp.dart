import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/helpers/api_service.dart';
import '../../../../orders/data/models/order_model.dart';
import 'sending_rep_orders_repo.dart';

class SendingRepOrdersRepoImpl implements SendingRepOrdersRepo {
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
  Future<Either<Failure, String>> changeOrderStatus({
    required String orderId,
    required String status,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url:
            "https://zilzal.pythonanywhere.com/api/v1/orders/$orderId/change_status/",
        data: {
          'status': status,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++change order status post data++++++++++++++");
      print(response.data);

      return right(response.data);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
