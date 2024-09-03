import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Features/profile/data/models/profile_model.dart';
import 'package:alzilzal/Features/profile/data/models/user_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileRepo profileRepo;

  LogoutModel? logoutModel;
  UserInfoModel? userInfoModel;

  Future<void> logoutFunction({
    required String refreshToken,
    required String accessToken,
  }) async {
    emit(LoadingLogoutProfileState());
    var result = await profileRepo.logoutFunction(
        refreshToken: refreshToken, accessToken: accessToken);
    result.fold((failure) {
      emit(ErrorLogoutProfileState());
    }, (value) {
      logoutModel = value;
      CacheHelper.removeData(key: AppKeys.accessTokenKey);
      CacheHelper.removeData(key: AppKeys.refreshTokenKey);
      CacheHelper.removeData(key: AppKeys.userRoleKey);
      CacheHelper.removeData(key: AppKeys.userId);
      emit(SuccessLogoutProfileState(value));
    });
  }

  Future<void> fetchUserInfo({
    required String accessToken,
  }) async {
    emit(LoadingFetchInfoProfileState());
    print("loading++++++++++++++++++++++++++");
    var result = await profileRepo.fetchUserInfo(accessToken: accessToken);
    result.fold((failure) {
      emit(ErrorFetchInfoProfileState());
    }, (value) {
      userInfoModel = value;
      print(value);
      emit(SuccessFetchInfoProfileState(value));
    });
  }
}
