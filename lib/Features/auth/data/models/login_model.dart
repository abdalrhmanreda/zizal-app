import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final int id;
  final String mobile;
  final String? fcmToken;
  final String? username;
  final String fullName;
  final String pic;
  final bool isActive;
  final bool isStaff;
  final String role;
  final TokensModel tokens;

  const LoginModel({
    required this.id,
    required this.fcmToken,
    required this.mobile,
    required this.username,
    required this.fullName,
    required this.pic,
    required this.isActive,
    required this.isStaff,
    required this.role,
    required this.tokens,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      fcmToken: json['fcm_token'],
      mobile: json['mobile'],
      username: json['username'],
      fullName: json['full_name'],
      pic: json['pic'],
      isActive: json['is_active'],
      isStaff: json['is_staff'],
      role: json['role'],
      tokens: TokensModel.fromJson(json['tokens']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        mobile,
        username,
        fullName,
        pic,
        isActive,
        isStaff,
        role,
        tokens,
        fcmToken
      ];
}

class TokensModel extends Equatable {
  final String refresh;
  final String access;

  const TokensModel({
    required this.refresh,
    required this.access,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) {
    return TokensModel(
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  @override
  List<Object?> get props => [refresh, access];
}
