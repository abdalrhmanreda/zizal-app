import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/helpers/api_service.dart';
import '../models/history_model.dart';
import 'receiving_repo.dart';

class ReceivingRepoImpl implements ReceivingRepo {
  @override
  Future<Either<Failure, String>> createNewPackageFun({
    required String accessToken,
    required String code,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: "https://zilzal.pythonanywhere.com/api/v1/orders/recieve_package/",
        options: Options(headers: {
          'Authorization': 'Bearer $accessToken',
        }),
        queryParameters: {
          'code': code,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++create package post data++++++++++++++");
      print(response.data);
      // final CreateNewPackageModel createList =
      //     CreateNewPackageModel.fromJson(response.data);

      return right("package with recieving Presentative");
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HistoryModel>>> fetchHistory({
    required int recieverId,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url:
            "https://zilzal.pythonanywhere.com/api/v1/orders/?reciever_presentative=$recieverId&status=wrp",
      ); // Replace with your API endpoint

      print("+++++++++++++fetch history get data++++++++++++++");
      print(response.data);
      final List<dynamic> responseData = response.data;
      final List<HistoryModel> historyList = responseData
          .map((orderData) => HistoryModel.fromJson(orderData))
          .toList();
      return right(historyList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
