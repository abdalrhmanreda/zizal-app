import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/helpers/api_service.dart';
import '../../../customer/create_order/data/models/pages_model.dart';
import '../models/statements_model.dart';
import 'statements_repo.dart';

class StatementsRepoImpl implements StatementsRepo {
  @override
  Future<Either<Failure, StatementsModel>> fetchPdf({
    required String page,
    required String accessToken,
    String? toDate,
    String? fromDate,
  }) async {
    try {
      late Response response;
      if (toDate == null || fromDate == null) {
        response = await DioHelper.getData(
          url: "https://zilzal.pythonanywhere.com/api/v1/orders/orders_pdf",
          queryParameters: {
            'page': page,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            },
          ),
        );
      } else {
        response = await DioHelper.getData(
          url: "https://zilzal.pythonanywhere.com/api/v1/orders/orders_pdf",
          queryParameters: {
            'page': page,
            'from_date': fromDate,
            'to_date': toDate,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            },
          ),
        );
      }

      print("+++++++++++++fetch pdf get data++++++++++++++");
      print(response.data);
      // If the response data is a list of banners
      final StatementsModel ordersStatusList =
          StatementsModel.fromJson(response.data);
      return right(ordersStatusList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PageModel>>> fetchPages({required int id}) async {
    try {
      Response response = await DioHelper.getData(
        url: "https://zilzal.pythonanywhere.com/api/v2/pages",
        queryParameters: {
          'customer': id,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++pages get data++++++++++++++");
      print(response.data);
      final List<PageModel> pagesList = (response.data as List)
          .map((json) => PageModel.fromJson(json))
          .toList();

      return right(pagesList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
