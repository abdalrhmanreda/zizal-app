import 'package:equatable/equatable.dart';

class LogoutModel extends Equatable {
  final String detail;

  const LogoutModel({
    required this.detail,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      detail: json['detail'],
    );
  }

  @override
  List<Object?> get props => [detail];
}
