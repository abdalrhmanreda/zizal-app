import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/helpers/api_service.dart';
import '../../../../orders/data/models/order_model.dart';
import '../models/banners_model.dart';
import '../models/orders_status_lentgh.dart';
import 'customer_home_repo.dart';

class CustomerHomeRepoImpl implements CustomerHomeRepo {
  @override
  Future<Either<Failure, List<BannerModel>>> fetchBanners() async {
    try {
      Response response = await DioHelper.getData(
        url: "http://zilzal.pythonanywhere.com/api/v4/banners/",
      ); // Replace with your API endpoint

      print("+++++++++++++fetch banners get data++++++++++++++");
      print(response.data);
      // If the response data is a list of banners
      final List<dynamic> responseData = response.data;
      final List<BannerModel> bannersList = responseData
          .map((bannerData) => BannerModel.fromJson(bannerData))
          .toList();
      return right(bannersList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> fetchOrdersByStatus({
    required String status,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url: "http://zilzal.pythonanywhere.com/api/v1/orders/?status=$status",
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
  Future<Either<Failure, OrderStatusLengthModel>> fetchOrdersNumbers({
    required String accessToken,
  }) async {
    try {
      Response response = await DioHelper.getData(
          url: CacheHelper.getDate(key: AppKeys.userRoleKey) == 'client'
              ? "https://zilzal.pythonanywhere.com/api/v1/orders/get_all_orders_status/"
              : "https://zilzal.pythonanywhere.com/api/v1/orders/get_follow_up_and_assistent_orders/",
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${CacheHelper.getDate(key: AppKeys.accessTokenKey)}',
            },
          )); // Replace with your API endpoint

      print("+++++++++++++fetch orders by status get data++++++++++++++");
      print(response.data);

      final OrderStatusLengthModel ordersStatusList =
          OrderStatusLengthModel.fromJson(response.data);
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
