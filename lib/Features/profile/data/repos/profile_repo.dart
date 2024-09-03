import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../orders/data/models/complain_model.dart';
import '../models/change_name_phone_model.dart';
import '../models/change_pass_model.dart';
import '../models/profile_model.dart';
import '../models/user_info_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, LogoutModel>> logoutFunction({
    required String refreshToken,
    required String accessToken,
  });
  Future<Either<Failure, UserInfoModel>> fetchUserInfo({
    required String accessToken,
  });
  Future<Either<Failure, ChangePassModel>> changePass({
    required String accessToken,
    required String oldPass,
    required String newPass,
  });
  Future<Either<Failure, List<ComplainModel>>> fetchComplains({
    required String clientId,
  });
  Future<Either<Failure, ChangeUserInfoModel>> changeNameOrPhone({
    required String name,
    required String phone,
    required String accessToken,
  });
}
