import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String image;
  final bool active;

  const BannerModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.active,
  });

  @override
  List<Object?> get props => [id, createdAt, updatedAt, image, active];

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'],
      active: json['active'],
    );
  }
}
