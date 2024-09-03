import 'package:alzilzal/Features/profile/data/models/user_info_model.dart';
import 'package:alzilzal/Features/profile/data/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/constatnts/api_const.dart';
import '../../../../Core/helpers/api_service.dart';
import '../../../../core/errors/failures.dart';
import '../../../orders/data/models/complain_model.dart';
import '../models/change_name_phone_model.dart';
import '../models/change_pass_model.dart';
import '../models/profile_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failure, LogoutModel>> logoutFunction({
    required String refreshToken,
    required String accessToken,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: "${ApiConst.baseUrl}logout/",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: {
          'refresh_token': refreshToken,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++logout post data++++++++++++++");
      print(response.data);
      // Convert response.data to LoginModel
      final logoutModel = LogoutModel.fromJson(response.data);

      return right(logoutModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfoModel>> fetchUserInfo({
    required String accessToken,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}user-info",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      ); // Replace with your API endpoint

      // print("+++++++++++++fetch User Info data++++++++++++++");
      // print(response.data);
      // Convert response.data to LoginModel
      final userModel = UserInfoModel.fromJson(response.data);

      return right(userModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangePassModel>> changePass({
    required String accessToken,
    required String oldPass,
    required String newPass,
  }) async {
    try {
      Response response = await DioHelper.putData(
        url: "https://zilzal.pythonanywhere.com/api/v2/change-password/",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: {
          'old_password': oldPass,
          'new_password': newPass,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++change Pass Put data++++++++++++++");
      print(response.data);
      // Convert response.data to LoginModel
      final userModel = ChangePassModel.fromJson(response.data);

      return right(userModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ComplainModel>>> fetchComplains({
    required String clientId,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url:
            "https://zilzal.pythonanywhere.com/api/v3/service-requests/?client=$clientId",
      ); // Replace with your API endpoint

      print("+++++++++++++fetch complains get data++++++++++++++");
      print(response.data);
      // Convert response.data to LoginModel
      final complainsList = List<Map<String, dynamic>>.from(response.data);
      final complainsModel =
          complainsList.map((json) => ComplainModel.fromJson(json)).toList();

      return right(complainsModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangeUserInfoModel>> changeNameOrPhone({
    required String name,
    required String phone,
    required String accessToken,
  }) async {
    try {
      Response response = await DioHelper.patchData(
        url: "https://zilzal.pythonanywhere.com/api/v2/user-info",
        options: Options(headers: {
          'Authorization': 'Bearer $accessToken',
        }),
        data: {
          'full_name': name,
          'mobile': phone,
        },
      ); // Replace with your API endpoint

      print("+++++++++++++change name or phone patch data++++++++++++++");
      print(response.data);
      // Convert response.data to LoginModel
      final complainsModel = ChangeUserInfoModel.fromJson(response.data);

      return right(complainsModel);
    } on Exception catch (e) {
      print("e.toString()------------");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
