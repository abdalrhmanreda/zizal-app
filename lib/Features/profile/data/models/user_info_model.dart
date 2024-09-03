import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  final int id;
  final String mobile;
  final String? username;
  final String fullName;
  final String pic;
  final bool isActive;
  final bool isStaff;
  final String role;

  const UserInfoModel({
    required this.id,
    required this.mobile,
    required this.username,
    required this.fullName,
    required this.pic,
    required this.isActive,
    required this.isStaff,
    required this.role,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      mobile: json['mobile'],
      username: json['username'],
      fullName: json['full_name'],
      pic: json['pic'],
      isActive: json['is_active'],
      isStaff: json['is_staff'],
      role: json['role'],
    );
  }

  @override
  List<Object?> get props =>
      [id, mobile, username, fullName, pic, isActive, isStaff, role];
}
