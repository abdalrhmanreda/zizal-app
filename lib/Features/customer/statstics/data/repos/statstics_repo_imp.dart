import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/helpers/api_service.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../../orders/data/models/order_model.dart';
import '../models/statistic_model.dart';
import 'statstics_repo.dart';

class StatisticsRepoImpl implements StatisticsRepo {
  @override
  Future<Either<Failure, StatisticsModel>> fetchStatisticsData({
    required String accessToken,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url:
            "https://zilzal.pythonanywhere.com/api/v1/orders/get_user_order_data",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++fetch statistic date get data++++++++++++++");
      print(response.data);
      // If the response data is a list of banners
      final ordersStatusList = StatisticsModel.fromJson(response.data);
      return right(ordersStatusList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> fetchOrdersWithNoStatements({
    required String accessToken,
    required int client,
    required bool isStatement,
  }) async {
    try {
      Response response = await DioHelper.getData(
          url: "https://zilzal.pythonanywhere.com/api/v1/orders/",
          queryParameters: {
            'client': client,
            'is_statement': isStatement,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${CacheHelper.getDate(key: AppKeys.accessTokenKey)}',
            },
          )); // Replace with your API endpoint

      print(
          "+++++++++++++fetch orders with no statements get data++++++++++++++");
      print(response.data);

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
}
