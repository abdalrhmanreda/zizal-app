class SearchModel {
  int? orderNumber;
  Client? client;
  String? qrcodeNumber;
  String? qrCode;
  String? customer;
  String? customerNumber;
  String? gov;
  String? address;
  String? type;
  String? nearestPoint;
  String? status;
  String? reason;
  String? notes;
  int? count;
  String? amount;
  String? amountType;
  String? receivedAmount;
  String? deliveryAmount;
  String? clientAmount;
  String? createdAt;
  String? updatedAt;
  bool? isStatement;
  bool? deliveredMoney;
  int? page;
  int? area;
  int? representative;
  String? transporter;
  int? receiverRepresentative;

  SearchModel({
    this.orderNumber,
    this.client,
    this.qrcodeNumber,
    this.qrCode,
    this.customer,
    this.customerNumber,
    this.gov,
    this.address,
    this.type,
    this.nearestPoint,
    this.status,
    this.reason,
    this.notes,
    this.count,
    this.amount,
    this.amountType,
    this.receivedAmount,
    this.deliveryAmount,
    this.clientAmount,
    this.createdAt,
    this.updatedAt,
    this.isStatement,
    this.deliveredMoney,
    this.page,
    this.area,
    this.representative,
    this.transporter,
    this.receiverRepresentative,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      orderNumber: json['order_number'],
      client: json['client'] != null ? Client.fromJson(json['client']) : null,
      qrcodeNumber: json['qrcode_number'],
      qrCode: json['qr_code'],
      customer: json['customer'],
      customerNumber: json['customer_number'],
      gov: json['gov'],
      address: json['address'],
      type: json['type'],
      nearestPoint: json['nearest_point'],
      status: json['status'],
      reason: json['reason'],
      notes: json['notes'],
      count: json['count'],
      amount: json['amount'],
      amountType: json['amount_type'],
      receivedAmount: json['received_amount'],
      deliveryAmount: json['delivery_amount'],
      clientAmount: json['client_amount'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isStatement: json['is_statement'],
      deliveredMoney: json['delivered_money'],
      page: json['page'],
      area: json['area'],
      representative: json['representative'],
      transporter: json['transporter'],
      receiverRepresentative: json['receiver_representative'],
    );
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
    data['gov'] = gov;
    data['address'] = address;
    data['type'] = type;
    data['nearest_point'] = nearestPoint;
    data['status'] = status;
    data['reason'] = reason;
    data['notes'] = notes;
    data['count'] = count;
    data['amount'] = amount;
    data['amount_type'] = amountType;
    data['received_amount'] = receivedAmount;
    data['delivery_amount'] = deliveryAmount;
    data['client_amount'] = clientAmount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_statement'] = isStatement;
    data['delivered_money'] = deliveredMoney;
    data['page'] = page;
    data['area'] = area;
    data['representative'] = representative;
    data['transporter'] = transporter;
    data['receiver_representative'] = receiverRepresentative;
    return data;
  }
}

class Client {
  int? id;
  String? mobile;
  String? username;
  String? fcmToken;
  String? gov;
  String? area;
  List<String>? pages;
  String? debit;
  String? credit;
  String? fullName;
  String? pic;
  List<AreaWithPrices>? areasWithPrices;
  bool? isActive;
  bool? isStaff;
  String? role;

  Client({
    this.id,
    this.mobile,
    this.username,
    this.fcmToken,
    this.gov,
    this.area,
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

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      mobile: json['mobile'],
      username: json['username'],
      fcmToken: json['fcm_token'],
      gov: json['gov'],
      area: json['area'],
      pages: json['pages']?.cast<String>(),
      debit: json['debit'],
      credit: json['credit'],
      fullName: json['full_name'],
      pic: json['pic'],
      areasWithPrices: json['areas_with_prices'] != null
          ? (json['areas_with_prices'] as List)
              .map((e) => AreaWithPrices.fromJson(e))
              .toList()
          : null,
      isActive: json['is_active'],
      isStaff: json['is_staff'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobile'] = mobile;
    data['username'] = username;
    data['fcm_token'] = fcmToken;
    data['gov'] = gov;
    data['area'] = area;
    if (pages != null) {
      data['pages'] = pages;
    }
    data['debit'] = debit;
    data['credit'] = credit;
    data['full_name'] = fullName;
    data['pic'] = pic;
    if (areasWithPrices != null) {
      data['areas_with_prices'] =
          areasWithPrices!.map((e) => e.toJson()).toList();
    }
    data['is_active'] = isActive;
    data['is_staff'] = isStaff;
    data['role'] = role;
    return data;
  }
}

class AreaWithPrices {
  int? id;
  String? customer;
  String? createdAt;
  String? updatedAt;
  String? baghdad;
  String? basra;
  String? nineveh;
  String? erbil;
  String? najaf;
  String? kirkuk;
  String? anbar;
  String? diyala;
  String? double;
  String? alQadisiyah;
  String? maysan;
  String? wasit;
  String? salahaddin;
  String? dohuk;
  String? sulaymaniyah;
  String? babylon;
  String? karbala;
  String? nasiriyah;

  AreaWithPrices({
    this.id,
    this.customer,
    this.createdAt,
    this.updatedAt,
    this.baghdad,
    this.basra,
    this.nineveh,
    this.erbil,
    this.najaf,
    this.kirkuk,
    this.anbar,
    this.diyala,
    this.double,
    this.alQadisiyah,
    this.maysan,
    this.wasit,
    this.salahaddin,
    this.dohuk,
    this.sulaymaniyah,
    this.babylon,
    this.karbala,
    this.nasiriyah,
  });

  factory AreaWithPrices.fromJson(Map<String, dynamic> json) {
    return AreaWithPrices(
      id: json['id'],
      customer: json['customer'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      baghdad: json['Baghdad'],
      basra: json['Basra'],
      nineveh: json['Nineveh'],
      erbil: json['Erbil'],
      najaf: json['Najaf'],
      kirkuk: json['Kirkuk'],
      anbar: json['Anbar'],
      diyala: json['Diyala'],
      double: json['Double'],
      alQadisiyah: json['AlQadisiyah'],
      maysan: json['Maysan'],
      wasit: json['Wasit'],
      salahaddin: json['Salahaddin'],
      dohuk: json['Dohuk'],
      sulaymaniyah: json['Sulaymaniyah'],
      babylon: json['Babylon'],
      karbala: json['Karbala'],
      nasiriyah: json['Nasiriyah'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['Baghdad'] = baghdad;
    data['Basra'] = basra;
    data['Nineveh'] = nineveh;
    data['Erbil'] = erbil;
    data['Najaf'] = najaf;
    data['Kirkuk'] = kirkuk;
    data['Anbar'] = anbar;
    data['Diyala'] = diyala;
    data['Double'] = double;
    data['AlQadisiyah'] = alQadisiyah;
    data['Maysan'] = maysan;
    data['Wasit'] = wasit;
    data['Salahaddin'] = salahaddin;
    data['Dohuk'] = dohuk;
    data['Sulaymaniyah'] = sulaymaniyah;
    data['Babylon'] = babylon;
    data['Karbala'] = karbala;
    data['Nasiriyah'] = nasiriyah;
    return data;
  }
}
