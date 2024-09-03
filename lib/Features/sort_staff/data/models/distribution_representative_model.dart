class DistributionRepresentativeModel {
  final int? id;
  final String? mobile;
  final String? username;
  final String? fcmToken;
  final int? area;
  final int? smallArea;
  final List<int>? pages;
  final String? debit;
  final String? credit;
  final String? fullName;
  final String? pic;
  List<String>? areasWithPrices;
  final bool? isActive;
  final bool? isStaff;
  final String? role;

  DistributionRepresentativeModel(
      {this.id,
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
      this.role});

  DistributionRepresentativeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mobile = json['mobile'],
        username = json['username'],
        fcmToken = json['fcm_token'],
        area = json['area'],
        smallArea = json['small_area'],
        pages = json['pages'].cast<int>(),
        debit = json['debit'],
        credit = json['credit'],
        fullName = json['full_name'],
        pic = json['pic'],
        areasWithPrices = json['areas_with_prices'].cast<String>(),
        isActive = json['is_active'],
        isStaff = json['is_staff'],
        role = json['role'];
  DistributionRepresentativeModel.toJson(Map<String, dynamic> json)
      : id = json['id'],
        mobile = json['mobile'],
        username = json['username'],
        fcmToken = json['fcm_token'],
        area = json['area'],
        smallArea = json['small_area'],
        pages = json['pages'].cast<int>(),
        debit = json['debit'],
        credit = json['credit'],
        fullName = json['full_name'],
        pic = json['pic'],
        areasWithPrices = json['areas_with_prices'].cast<String>(),
        isActive = json['is_active'],
        isStaff = json['is_staff'],
        role = json['role'];
}
