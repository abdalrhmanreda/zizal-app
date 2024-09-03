import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/add_fcm_token_model.dart';
import '../models/create_fcm_device.dart';
import '../models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> loginFunction({
    required String phoneOrEmail,
    required String pass,
  });
  Future<Either<Failure, AllFcmTokenModel>> addFCMToken({
    required String accessToken,
    required String fcmToken,
  });
  Future<Either<Failure, CreateFCMDeviceModel>> createFCMDevice({
    required String name,
    required String regId,
    required String deviceId,
    required String type,
  });
}
