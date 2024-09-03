import 'package:equatable/equatable.dart';

class ComplainModel extends Equatable {
  final int id;
  final String client;
  final String createdAt;
  final String updatedAt;
  final String complain;
  final String status;
  final int priority;
  final int order;

  const ComplainModel({
    required this.id,
    required this.client,
    required this.createdAt,
    required this.updatedAt,
    required this.complain,
    required this.status,
    required this.priority,
    required this.order,
  });

  factory ComplainModel.fromJson(Map<String, dynamic> json) {
    return ComplainModel(
      id: json['id'],
      client: json['client'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      complain: json['complain'],
      status: json['status'],
      priority: json['priority'],
      order: json['order'],
    );
  }

  @override
  List<Object?> get props =>
      [id, client, createdAt, updatedAt, complain, status, priority, order];
}
