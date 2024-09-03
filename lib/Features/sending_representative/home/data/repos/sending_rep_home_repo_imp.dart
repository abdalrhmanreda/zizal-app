import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/helpers/api_service.dart';
import '../models/rep_orders_model.dart';
import 'sending_rep_home_repo.dart';

class SendingRepHomeRepoImpl implements SendingRepHomeRepo {
  @override
  Future<Either<Failure, RepOrdersModel>> fetchOrders({
    required String accessToken,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url:
            "https://zilzal.pythonanywhere.com/api/v1/orders/representative_orders",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++fetch orders get data++++++++++++++");
      print(response.data);

      final RepOrdersModel ordersStatusList =
          RepOrdersModel.fromJson(response.data);
      return right(ordersStatusList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
