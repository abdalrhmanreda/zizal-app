class RepOrdersModel {
  List<InTheWayOrders>? inTheWayOrders;
  int? inTheWayOrdersLength;
  List<InTheWayOrders>? replaceOrders; // Added replaceOrders
  int? replaceOrdersLength; // Added replaceOrdersLength
  List<InTheWayOrders>? resendOrders;
  int? resendOrdersLength;
  List<InTheWayOrders>? deliveredOrders;
  int? deliveredOrdersLength;
  List<InTheWayOrders>? partReturnOrders;
  int? partReturnOrdersLength;
  List<InTheWayOrders>? fullReturnOrders;
  int? fullReturnOrdersLength;
  List<InTheWayOrders>? inprogress;
  int? inprogressLength;
  List<InTheWayOrders>? delayedOrders;
  int? delayedOrdersLength;

  RepOrdersModel({
    this.inTheWayOrders,
    this.inTheWayOrdersLength,
    this.replaceOrders,
    this.replaceOrdersLength,
    this.resendOrders,
    this.resendOrdersLength,
    this.deliveredOrders,
    this.deliveredOrdersLength,
    this.partReturnOrders,
    this.partReturnOrdersLength,
    this.fullReturnOrders,
    this.fullReturnOrdersLength,
    this.inprogress,
    this.inprogressLength,
    this.delayedOrders,
    this.delayedOrdersLength,
  });

  RepOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['in_the_way_orders'] != null) {
      inTheWayOrders = <InTheWayOrders>[];
      json['in_the_way_orders'].forEach((v) {
        inTheWayOrders!.add(InTheWayOrders.fromJson(v));
      });
    }
    inTheWayOrdersLength = json['in_the_way_orders length'];

    // Added handling for replace_orders and replace_orders_length
    if (json['replace_orders'] != null) {
      replaceOrders = <InTheWayOrders>[];
      json['replace_orders'].forEach((v) {
        replaceOrders!.add(InTheWayOrders.fromJson(v));
      });
    }
    replaceOrdersLength = json['replace_orders length'];

    if (json['resend_orders'] != null) {
      resendOrders = <InTheWayOrders>[];
      json['resend_orders'].forEach((v) {
        resendOrders!.add(InTheWayOrders.fromJson(v));
      });
    }
    resendOrdersLength = json['resend_orders length'];
    if (json['delivered_orders'] != null) {
      deliveredOrders = <InTheWayOrders>[];
      json['delivered_orders'].forEach((v) {
        deliveredOrders!.add(InTheWayOrders.fromJson(v));
      });
    }
    deliveredOrdersLength = json['delivered_orders length'];
    if (json['part_return_orders'] != null) {
      partReturnOrders = <InTheWayOrders>[];
      json['part_return_orders'].forEach((v) {
        partReturnOrders!.add(InTheWayOrders.fromJson(v));
      });
    }
    partReturnOrdersLength = json['part_return_orders length'];
    if (json['full_return_orders'] != null) {
      fullReturnOrders = <InTheWayOrders>[];
      json['full_return_orders'].forEach((v) {
        fullReturnOrders!.add(InTheWayOrders.fromJson(v));
      });
    }
    fullReturnOrdersLength = json['full_return_orders length'];
    if (json['inprogress'] != null) {
      inprogress = <InTheWayOrders>[];
      json['inprogress'].forEach((v) {
        inprogress!.add(InTheWayOrders.fromJson(v));
      });
    }
    inprogressLength = json['inprogress length'];
    if (json['delayed_orders'] != null) {
      delayedOrders = <InTheWayOrders>[];
      json['delayed_orders'].forEach((v) {
        delayedOrders!.add(InTheWayOrders.fromJson(v));
      });
    }
    delayedOrdersLength = json['delayed_orders length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (inTheWayOrders != null) {
      data['in_the_way_orders'] =
          inTheWayOrders!.map((v) => v.toJson()).toList();
    }
    data['in_the_way_orders length'] = inTheWayOrdersLength;
    if (replaceOrders != null) {
      data['replace_orders'] = replaceOrders!.map((v) => v.toJson()).toList();
    }
    data['replace_orders length'] = replaceOrdersLength;
    if (resendOrders != null) {
      data['resend_orders'] = resendOrders!.map((v) => v.toJson()).toList();
    }
    data['resend_orders length'] = resendOrdersLength;
    if (deliveredOrders != null) {
      data['delivered_orders'] =
          deliveredOrders!.map((v) => v.toJson()).toList();
    }
    data['delivered_orders length'] = deliveredOrdersLength;
    if (partReturnOrders != null) {
      data['part_return_orders'] =
          partReturnOrders!.map((v) => v.toJson()).toList();
    }
    data['part_return_orders length'] = partReturnOrdersLength;
    if (fullReturnOrders != null) {
      data['full_return_orders'] =
          fullReturnOrders!.map((v) => v.toJson()).toList();
    }
    data['full_return_orders length'] = fullReturnOrdersLength;
    if (inprogress != null) {
      data['inprogress'] = inprogress!.map((v) => v.toJson()).toList();
    }
    data['inprogress length'] = inprogressLength;
    if (delayedOrders != null) {
      data['delayed_orders'] = delayedOrders!.map((v) => v.toJson()).toList();
    }
    data['delayed_orders length'] = delayedOrdersLength;
    return data;
  }
}

class InTheWayOrders {
  int? orderNumber;
  Client? client;
  String? qrcodeNumber;
  dynamic qrCode;
  String? customer;
  String? customerNumber;
  String? address;
  String? type;
  String? nearestPoint;
  String? status;
  dynamic reason;
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
  int? smallArea;
  int? area;
  int? presentative;
  dynamic transporter;
  dynamic recieverPresentative;

  InTheWayOrders({
    this.orderNumber,
    this.client,
    this.qrcodeNumber,
    this.qrCode,
    this.customer,
    this.customerNumber,
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
    this.smallArea,
    this.area,
    this.presentative,
    this.transporter,
    this.recieverPresentative,
  });

  InTheWayOrders.fromJson(Map<String, dynamic> json) {
    orderNumber = json['order_number'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    qrcodeNumber = json['qrcode_number'];
    qrCode = json['qr_code'];
    customer = json['customer'];
    customerNumber = json['customer_number'];
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
    smallArea = json['small_area'];
    area = json['area'];
    presentative = json['presentative'];
    transporter = json['transporter'];
    recieverPresentative = json['reciever_presentative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['order_number'] = orderNumber;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    data['qrcode_number'] = qrcodeNumber;
    data['qr_code'] = qrCode;
    data['customer'] = customer;
    data['customer_number'] = customerNumber;
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
    data['small_area'] = smallArea;
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
  dynamic area;
  dynamic smallArea;
  List<Pages>? pages;
  String? debit;
  String? credit;
  String? fullName;
  String? pic;
  List<dynamic>? areasWithPrices;
  bool? isActive;
  bool? isStaff;
  String? role;

  Client({
    this.id,
    this.mobile,
    this.username,
    this.fcmToken,
    this.area,
    this.smallArea,
    this.pages,
    this.debit,
    this.credit,
    this.fullName,
    this.pic,
    this.areasWithPrices,
    this.isActive,
    this.isStaff,
    this.role,
  });

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    username = json['username'];
    fcmToken = json['fcm_token'];
    area = json['area'];
    smallArea = json['small_area'];
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
    if (json['areas_with_prices'] != null) {
      areasWithPrices = <dynamic>[];
      json['areas_with_prices'].forEach((v) {
        areasWithPrices!.add(v);
      });
    }
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['mobile'] = mobile;
    data['username'] = username;
    data['fcm_token'] = fcmToken;
    data['area'] = area;
    data['small_area'] = smallArea;
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    data['debit'] = debit;
    data['credit'] = credit;
    data['full_name'] = fullName;
    data['pic'] = pic;
    if (areasWithPrices != null) {
      data['areas_with_prices'] = areasWithPrices!.toList();
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

  Pages({
    this.id,
    this.customer,
    this.createdAt,
    this.updatedAt,
    this.title,
  });

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['customer'] = customer;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    return data;
  }
}
