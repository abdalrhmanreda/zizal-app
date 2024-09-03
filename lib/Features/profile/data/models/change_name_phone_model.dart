import 'package:equatable/equatable.dart';

class ChangeUserInfoModel extends Equatable {
  final int id;
  final String mobile;
  final String? username;
  final List<dynamic>
      pages; // Adjust the type if you have a specific model for pages
  final String fullName;
  final String pic;
  final List<AreaWithPrice> areasWithPrices;
  final bool isActive;
  final bool isStaff;
  final String role;

  const ChangeUserInfoModel({
    required this.id,
    required this.mobile,
    this.username,
    required this.pages,
    required this.fullName,
    required this.pic,
    required this.areasWithPrices,
    required this.isActive,
    required this.isStaff,
    required this.role,
  });

  @override
  List<Object?> get props => [
        id,
        mobile,
        username,
        pages,
        fullName,
        pic,
        areasWithPrices,
        isActive,
        isStaff,
        role
      ];

  factory ChangeUserInfoModel.fromJson(Map<String, dynamic> json) {
    return ChangeUserInfoModel(
      id: json['id'],
      mobile: json['mobile'],
      username: json['username'],
      pages: json['pages'],
      fullName: json['full_name'],
      pic: json['pic'],
      areasWithPrices: (json['areas_with_prices'] as List)
          .map((e) => AreaWithPrice.fromJson(e))
          .toList(),
      isActive: json['is_active'],
      isStaff: json['is_staff'],
      role: json['role'],
    );
  }
}

class AreaWithPrice extends Equatable {
  final int id;
  final String customer;
  final String createdAt;
  final String updatedAt;
  final String price;
  final int area;

  const AreaWithPrice({
    required this.id,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
    required this.area,
  });

  @override
  List<Object> get props => [id, customer, createdAt, updatedAt, price, area];

  factory AreaWithPrice.fromJson(Map<String, dynamic> json) {
    return AreaWithPrice(
      id: json['id'],
      customer: json['customer'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      price: json['price'],
      area: json['area'],
    );
  }
}
