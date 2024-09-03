import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../Core/helpers/api_service.dart';
import 'sort_staff_repo.dart';

class SortStaffRepoImpl implements SortStaffRepo {
  @override
  Future<Either<Failure, String>> receivePackageFun({
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
      print("+++++++++++++receive package post data++++++++++++++");
      print(response.data);
      final String receiveList = response.data;

      return right(receiveList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
