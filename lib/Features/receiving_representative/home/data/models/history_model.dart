class HistoryModel {
  int? orderNumber;
  Client? client;
  String? qrcodeNumber;
  dynamic qrCode;
  String? customer;
  String? customerNumber;
  String? country;
  String? address;
  String? type;
  String? nearestPoint;
  String? status;
  dynamic? reason;
  String? notes;
  int? count;
  String? amount;
  String? amountType;
  String? recievedAmount;
  String? deliveryAmount;
  String? clientAmount;
  String? createdAt;
  String? updatedAt;
  bool? isStatement;
  bool? deliveredMoney;
  int? page;
  int? area;
  dynamic presentative;
  dynamic transporter;
  int? recieverPresentative;

  HistoryModel(
      {this.orderNumber,
      this.client,
      this.qrcodeNumber,
      this.qrCode,
      this.customer,
      this.customerNumber,
      this.country,
      this.address,
      this.type,
      this.nearestPoint,
      this.status,
      this.reason,
      this.notes,
      this.count,
      this.amount,
      this.amountType,
      this.recievedAmount,
      this.deliveryAmount,
      this.clientAmount,
      this.createdAt,
      this.updatedAt,
      this.isStatement,
      this.deliveredMoney,
      this.page,
      this.area,
      this.presentative,
      this.transporter,
      this.recieverPresentative});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    orderNumber = json['order_number'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    qrcodeNumber = json['qrcode_number'];
    qrCode = json['qr_code'];
    customer = json['customer'];
    customerNumber = json['customer_number'];
    country = json['country'];
    address = json['address'];
    type = json['type'];
    nearestPoint = json['nearest_point'];
    status = json['status'];
    reason = json['reason'];
    notes = json['notes'];
    count = json['count'];
    amount = json['amount'];
    amountType = json['amount_type'];
    recievedAmount = json['recieved_amount'];
    deliveryAmount = json['delivery_amount'];
    clientAmount = json['client_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isStatement = json['is_statement'];
    deliveredMoney = json['delivered_money'];
    page = json['page'];
    area = json['area'];
    presentative = json['presentative'];
    transporter = json['transporter'];
    recieverPresentative = json['reciever_presentative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_number'] = orderNumber;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    data['qrcode_number'] = qrcodeNumber;
    data['qr_code'] = qrCode;
    data['customer'] = customer;
    data['customer_number'] = customerNumber;
    data['country'] = country;
    data['address'] = address;
    data['type'] = type;
    data['nearest_point'] = nearestPoint;
    data['status'] = status;
    data['reason'] = reason;
    data['notes'] = notes;
    data['count'] = count;
    data['amount'] = amount;
    data['amount_type'] = amountType;
    data['recieved_amount'] = recievedAmount;
    data['delivery_amount'] = deliveryAmount;
    data['client_amount'] = clientAmount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_statement'] = isStatement;
    data['delivered_money'] = deliveredMoney;
    data['page'] = page;
    data['area'] = area;
    data['presentative'] = presentative;
    data['transporter'] = transporter;
    data['reciever_presentative'] = recieverPresentative;
    return data;
  }
}

class Client {
  int? id;
  String? mobile;
  dynamic username;
  String? fcmToken;
  List<Pages>? pages;
  String? debit;
  String? credit;
  String? fullName;
  String? pic;
  List<dynamic>? areasWithPrices;
  bool? isActive;
  bool? isStaff;
  String? role;

  Client(
      {this.id,
      this.mobile,
      this.username,
      this.fcmToken,
      this.pages,
      this.debit,
      this.credit,
      this.fullName,
      this.pic,
      this.areasWithPrices,
      this.isActive,
      this.isStaff,
      this.role});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    username = json['username'];
    fcmToken = json['fcm_token'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    }
    debit = json['debit'];
    credit = json['credit'];
    fullName = json['full_name'];
    pic = json['pic'];
    // if (json['areas_with_prices'] != null) {
    //   areasWithPrices = <dynamic>[];
    //   json['areas_with_prices'].forEach((v) {
    //     areasWithPrices!.add( dynamic.fromJson(v));
    //   });
    // }
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobile'] = mobile;
    data['username'] = username;
    data['fcm_token'] = fcmToken;
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    data['debit'] = debit;
    data['credit'] = credit;
    data['full_name'] = fullName;
    data['pic'] = pic;
    if (areasWithPrices != null) {
      data['areas_with_prices'] =
          areasWithPrices!.map((v) => v.toJson()).toList();
    }
    data['is_active'] = isActive;
    data['is_staff'] = isStaff;
    data['role'] = role;
    return data;
  }
}

class Pages {
  int? id;
  String? customer;
  String? createdAt;
  String? updatedAt;
  String? title;

  Pages({this.id, this.customer, this.createdAt, this.updatedAt, this.title});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    return data;
  }
}
