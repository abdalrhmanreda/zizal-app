import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/constatnts/api_const.dart';
import '../../../../Core/helpers/api_service.dart';
import '../../../../core/errors/failures.dart';
import '../models/add_fcm_token_model.dart';
import '../models/create_fcm_device.dart';
import '../models/login_model.dart';
import 'login_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, LoginModel>> loginFunction({
    required String phoneOrEmail,
    required String pass,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: "${ApiConst.baseUrl}login/",
        data: {
          'email_or_phone': phoneOrEmail,
          'password': pass,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++login post data++++++++++++++");
      print(response.data);
      // Convert response.data to LoginModel
      final loginModel = LoginModel.fromJson(response.data);

      return right(loginModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllFcmTokenModel>> addFCMToken({
    required String accessToken,
    required String fcmToken,
  }) async {
    try {
      Response response = await DioHelper.patchData(
        url: "https://zilzal.pythonanywhere.com/api/v2/user-info",
        options: Options(headers: {
          'Authorization': 'Bearer $accessToken',
        }),
        data: {
          'fcm_token': fcmToken,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++add fcm token patch data++++++++++++++");
      print(response.data);
      // Convert response.data to AllFcmTokenModel
      final fcmModel = AllFcmTokenModel.fromJson(response.data);

      return right(fcmModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateFCMDeviceModel>> createFCMDevice({
    required String name,
    required String regId,
    required String deviceId,
    required String type,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: "https://zilzal.pythonanywhere.com/api/fcm/devices/",
        data: {
          'name': name,
          'registration_id': regId,
          'device_id': deviceId,
          'active': true,
          'type': type,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++create fcm device post data++++++++++++++");
      print(response.data);
      // Convert response.data to AllFcmTokenModel
      final fcmModel = CreateFCMDeviceModel.fromJson(response.data);

      return right(fcmModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
