import 'package:alzilzal/Features/customer/create_order/data/models/create_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/helpers/api_service.dart';
import '../../../../orders/data/models/complain_model.dart';
import '../models/areas_model.dart';
import '../models/pages_model.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  @override
  Future<Either<Failure, List<AreasModel>>> fetchAreas() async {
    try {
      Response response = await DioHelper.getData(
        url: "https://zilzal.pythonanywhere.com/api/v1/areas/get_governorate/",
      ); // Replace with your API endpoint

      print("+++++++++++++areas get data++++++++++++++");
      print(response.data);
      final List<AreasModel> areasList = (response.data as List)
          .map((json) => AreasModel.fromJson(json))
          .toList();

      return right(areasList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateModel>> createOrderFunc({
    required String accessToken,
    required String customerName,
    required String customerNumber,
    required String address,
    required String area,
    required String amount,
    required String notes,
    required String nearestPoint,
    required String type,
    required String amountType,
    required int count,
    required int? page,
    required String gov,
    String? qrCode,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: "https://zilzal.pythonanywhere.com/api/v1/orders/",
        options: Options(headers: {
          'Authorization': 'Bearer $accessToken',
        }),
        data: {
          'customer': customerName,
          'customer_number': customerNumber,
          'address': address,
          'area': area,
          'gov': gov,
          'amount': amount,
          'notes': notes,
          'nearest_point': nearestPoint,
          'type': type,
          'amount_type': amountType,
          'count': count,
          'page': page,
          'qrcode_number': qrCode,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++create order post data++++++++++++++");
      print(response.data);
      final CreateModel createList = CreateModel.fromJson(response.data);

      return right(createList);
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

  @override
  Future<Either<Failure, ComplainModel>> makeComplain({
    required String accessToken,
    required String complain,
    required String orderId,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: "https://zilzal.pythonanywhere.com/api/v3/service-requests/",
          data: {
            'complain': complain,
            'order': orderId,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            },
          )); // Replace with your API endpoint

      print("+++++++++++++make complain post data++++++++++++++");
      print(response.data);
      final ComplainModel complainList = ComplainModel.fromJson(response.data);

      return right(complainList);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
