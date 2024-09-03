class CreateModel {
  int orderNumber;
  Client client;
  String qrcodeNumber;
  String qrCode;
  String customer;
  String customerNumber;
  String gov;
  String address;
  String type;
  String nearestPoint;
  String status;
  String? reason;
  String notes;
  int count;
  String amount;
  String amountType;
  String recievedAmount;
  String deliveryAmount;
  String clientAmount;
  String createdAt;
  String updatedAt;
  bool isStatement;
  bool deliveredMoney;
  int page;
  int area;
  dynamic presentative;
  dynamic transporter;
  dynamic recieverPresentative;

  CreateModel({
    required this.orderNumber,
    required this.client,
    required this.qrcodeNumber,
    required this.qrCode,
    required this.customer,
    required this.customerNumber,
    required this.gov,
    required this.address,
    required this.type,
    required this.nearestPoint,
    required this.status,
    this.reason,
    required this.notes,
    required this.count,
    required this.amount,
    required this.amountType,
    required this.recievedAmount,
    required this.deliveryAmount,
    required this.clientAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.isStatement,
    required this.deliveredMoney,
    required this.page,
    required this.area,
    this.presentative,
    this.transporter,
    this.recieverPresentative,
  });

  factory CreateModel.fromJson(Map<String, dynamic> json) {
    return CreateModel(
      orderNumber: json['order_number'],
      client: Client.fromJson(json['client']),
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
      recievedAmount: json['recieved_amount'],
      deliveryAmount: json['delivery_amount'],
      clientAmount: json['client_amount'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isStatement: json['is_statement'],
      deliveredMoney: json['delivered_money'],
      page: json['page'],
      area: json['area'],
      presentative: json['presentative'],
      transporter: json['transporter'],
      recieverPresentative: json['reciever_presentative'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_number': orderNumber,
      'client': client.toJson(),
      'qrcode_number': qrcodeNumber,
      'qr_code': qrCode,
      'customer': customer,
      'customer_number': customerNumber,
      'gov': gov,
      'address': address,
      'type': type,
      'nearest_point': nearestPoint,
      'status': status,
      'reason': reason,
      'notes': notes,
      'count': count,
      'amount': amount,
      'amount_type': amountType,
      'recieved_amount': recievedAmount,
      'delivery_amount': deliveryAmount,
      'client_amount': clientAmount,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_statement': isStatement,
      'delivered_money': deliveredMoney,
      'page': page,
      'area': area,
      'presentative': presentative,
      'transporter': transporter,
      'reciever_presentative': recieverPresentative,
    };
  }
}

class Client {
  int id;
  String mobile;
  String? username;
  String? efjcwthlqomfvi5oz8yse;
  String? gov;
  String? area;
  List<Page> pages;
  String debit;
  String credit;
  String fullName;
  String pic;
  List<AreaWithPrices> areasWithPrices;
  bool isActive;
  bool isStaff;
  String role;

  Client({
    required this.id,
    required this.mobile,
    this.username,
    this.efjcwthlqomfvi5oz8yse,
    this.gov,
    this.area,
    required this.pages,
    required this.debit,
    required this.credit,
    required this.fullName,
    required this.pic,
    required this.areasWithPrices,
    required this.isActive,
    required this.isStaff,
    required this.role,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      mobile: json['mobile'],
      username: json['username'],
      efjcwthlqomfvi5oz8yse: json[
          'eFJcWtHlQomFvI-5oZ8ysE:APA91bEw5bpjDEEBYEeKGVQ_btszX6YWq9g-rX5peQLItkTlhgfNzbMyiXhBZ8I7TQpdPjCX_jHh3naTIq2N7xW_Di1jcCu6ZPMmwTCrH6OWhvvv09ZMMYkHkm8u5T2qwGmP2Mpkab7v'],
      gov: json['gov'],
      area: json['area'],
      pages: List<Page>.from(json['pages'].map((x) => Page.fromJson(x))),
      debit: json['debit'],
      credit: json['credit'],
      fullName: json['full_name'],
      pic: json['pic'],
      areasWithPrices: List<AreaWithPrices>.from(
          json['areas_with_prices'].map((x) => AreaWithPrices.fromJson(x))),
      isActive: json['is_active'],
      isStaff: json['is_staff'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mobile': mobile,
      'username': username,
      'eFJcWtHlQomFvI-5oZ8ysE:APA91bEw5bpjDEEBYEeKGVQ_btszX6YWq9g-rX5peQLItkTlhgfNzbMyiXhBZ8I7TQpdPjCX_jHh3naTIq2N7xW_Di1jcCu6ZPMmwTCrH6OWhvvv09ZMMYkHkm8u5T2qwGmP2Mpkab7v':
          efjcwthlqomfvi5oz8yse,
      'gov': gov,
      'area': area,
      'pages': List<dynamic>.from(pages.map((x) => x.toJson())),
      'debit': debit,
      'credit': credit,
      'full_name': fullName,
      'pic': pic,
      'areas_with_prices':
          List<dynamic>.from(areasWithPrices.map((x) => x.toJson())),
      'is_active': isActive,
      'is_staff': isStaff,
      'role': role,
    };
  }
}

class Page {
  int id;
  String customer;
  String createdAt;
  String updatedAt;
  String title;

  Page({
    required this.id,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      id: json['id'],
      customer: json['customer'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'title': title,
    };
  }
}

class AreaWithPrices {
  int id;
  String customer;
  String createdAt;
  String updatedAt;
  String baghdad;
  String basra;
  String nineveh;
  String erbil;
  String najaf;
  String kirkuk;
  String anbar;
  String diyala;
  String doublePrice;
  String alQadisiyah;
  String maysan;
  String wasit;
  String salahaddin;
  String dohuk;
  String sulaymaniyah;
  String babylon;
  String karbala;
  String nasiriyah;

  AreaWithPrices({
    required this.id,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
    required this.baghdad,
    required this.basra,
    required this.nineveh,
    required this.erbil,
    required this.najaf,
    required this.kirkuk,
    required this.anbar,
    required this.diyala,
    required this.doublePrice,
    required this.alQadisiyah,
    required this.maysan,
    required this.wasit,
    required this.salahaddin,
    required this.dohuk,
    required this.sulaymaniyah,
    required this.babylon,
    required this.karbala,
    required this.nasiriyah,
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
      doublePrice: json['Double'],
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
    return {
      'id': id,
      'customer': customer,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'Baghdad': baghdad,
      'Basra': basra,
      'Nineveh': nineveh,
      'Erbil': erbil,
      'Najaf': najaf,
      'Kirkuk': kirkuk,
      'Anbar': anbar,
      'Diyala': diyala,
      'Double': doublePrice,
      'AlQadisiyah': alQadisiyah,
      'Maysan': maysan,
      'Wasit': wasit,
      'Salahaddin': salahaddin,
      'Dohuk': dohuk,
      'Sulaymaniyah': sulaymaniyah,
      'Babylon': babylon,
      'Karbala': karbala,
      'Nasiriyah': nasiriyah,
    };
  }
}
