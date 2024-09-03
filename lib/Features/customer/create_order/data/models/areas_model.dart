import 'package:equatable/equatable.dart';

class AreasModel extends Equatable {
  final int id;
  final String name;
  final String? parent; // New attribute

  const AreasModel({
    required this.id,
    required this.name,
    required this.parent, // Include parent in the constructor
  });

  @override
  List<Object?> get props => [id, name, parent]; // Include parent in props

  factory AreasModel.fromJson(Map<String, dynamic> json) {
    return AreasModel(
      id: json['id'],
      name: json['name'],
      parent:
          json['parent'] is int ? json['parent'].toString() : json['parent'],
    );
  }
}
