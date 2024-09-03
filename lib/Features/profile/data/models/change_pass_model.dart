import 'package:equatable/equatable.dart';

class ChangePassModel<T> extends Equatable {
  final String status;
  final int code;
  final String message;
  final T data;

  const ChangePassModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, code, message, data];

  factory ChangePassModel.fromJson(Map<String, dynamic> json) {
    return ChangePassModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: json['data'], // Update the type according to your specific use case
    );
  }
}
