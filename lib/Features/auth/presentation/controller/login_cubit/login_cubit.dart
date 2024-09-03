import 'package:alzilzal/Features/auth/data/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;

  LoginModel? loginModel;

  Future<void> loginFunction({
    required String phoneOrEmail,
    required String pass,
  }) async {
    emit(LoadingLoginState());
    var result =
        await authRepo.loginFunction(phoneOrEmail: phoneOrEmail, pass: pass);
    result.fold((failure) {
      emit(ErrorLoginState());
    }, (value) {
      loginModel = value;
      CacheHelper.saveData(
          key: AppKeys.accessTokenKey, value: value.tokens.access);
      CacheHelper.saveData(
          key: AppKeys.refreshTokenKey, value: value.tokens.refresh);
      CacheHelper.saveData(key: AppKeys.userRoleKey, value: value.role);
      print('////////////////////////${value.role}');
      CacheHelper.saveData(key: AppKeys.userId, value: value.id);
      emit(SuccessLoginState(value));
    });
  }

  Future<void> addFcmFunc({
    required String accessToken,
    required String fcmToken,
  }) async {
    emit(LoadingAddFCMLoginState());
    var result = await authRepo.addFCMToken(
        accessToken: accessToken, fcmToken: fcmToken);
    result.fold((failure) {
      emit(ErrorAddFCMLoginState());
    }, (value) {
      emit(SuccessAddFCMLoginState());
    });
  }

  Future<void> createFcmDevice({
    required String name,
    required String type,
    required String fcmToken,
  }) async {
    emit(LoadingCreateFCMLoginState());
    var result = await authRepo.createFCMDevice(
      name: name,
      type: type,
      deviceId: fcmToken,
      regId: fcmToken,
    );
    result.fold((failure) {
      emit(ErrorCreateFCMLoginState());
    }, (value) {
      emit(SuccessCreateFCMLoginState());
    });
  }
}
