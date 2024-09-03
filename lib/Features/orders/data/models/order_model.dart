class OrderModel {
  int orderNumber;
  Client client;
  String customer;
  String customerNumber;
  String? country;
  String address;
  String? type;
  String? nearestPoint;
  String? status;
  String? reason;
  String? notes;
  String? amount;
  String? amountType;
  String? recievedAmount;
  String? deliveryAmount;
  String? clientAmount;
  String createdAt;
  String updatedAt;
  int? area;
  int? presentative;

  OrderModel({
    required this.orderNumber,
    required this.client,
    required this.customer,
    required this.customerNumber,
    required this.country,
    required this.address,
    required this.type,
    required this.nearestPoint,
    required this.status,
    this.reason,
    required this.notes,
    required this.amount,
    required this.amountType,
    required this.recievedAmount,
    required this.deliveryAmount,
    required this.clientAmount,
    required this.createdAt,
    required this.updatedAt,
    this.area,
    required this.presentative,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderNumber: json['order_number'],
        client: Client.fromJson(json['client']),
        customer: json['customer'],
        customerNumber: json['customer_number'],
        country: json['country'],
        address: json['address'],
        type: json['type'],
        nearestPoint: json['nearest_point'],
        status: json['status'],
        reason: json['reason'],
        notes: json['notes'],
        amount: json['amount'],
        amountType: json['amount_type'],
        recievedAmount: json['recieved_amount'],
        deliveryAmount: json['delivery_amount'],
        clientAmount: json['client_amount'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        area: json['area'],
        presentative: json['presentative'],
      );

  Map<String, dynamic> toJson() => {
        'order_number': orderNumber,
        'client': client.toJson(),
        'customer': customer,
        'customer_number': customerNumber,
        'country': country,
        'address': address,
        'type': type,
        'nearest_point': nearestPoint,
        'status': status,
        'reason': reason,
        'notes': notes,
        'amount': amount,
        'amount_type': amountType,
        'recieved_amount': recievedAmount,
        'delivery_amount': deliveryAmount,
        'client_amount': clientAmount,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'area': area,
        'presentative': presentative,
      };
}

class Client {
  int id;
  String mobile;
  String? username;
  List<dynamic> pages;
  String fullName;
  String pic;
  List<dynamic> areasWithPrices;
  bool isActive;
  bool isStaff;
  String role;

  Client({
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

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'],
        mobile: json['mobile'],
        username: json['username'],
        pages: json['pages'],
        fullName: json['full_name'],
        pic: json['pic'],
        areasWithPrices: json['areas_with_prices'],
        isActive: json['is_active'],
        isStaff: json['is_staff'],
        role: json['role'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'mobile': mobile,
        'username': username,
        'pages': pages,
        'full_name': fullName,
        'pic': pic,
        'areas_with_prices': areasWithPrices,
        'is_active': isActive,
        'is_staff': isStaff,
        'role': role,
      };
}
