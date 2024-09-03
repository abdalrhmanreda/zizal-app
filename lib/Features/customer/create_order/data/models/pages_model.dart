class PageModel {
  int id;
  String customer;
  String createdAt;
  String updatedAt;
  String title;

  PageModel({
    required this.id,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
  });

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
        id: json['id'],
        customer: json['customer'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer': customer,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'title': title,
      };
}
