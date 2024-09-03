import 'package:equatable/equatable.dart';

class OrderStatusLengthModel extends Equatable {
  final int? inprogress;
  final int? recorded;
  final int? inTheWay;
  final int? delivered;
  final int? replace;
  final int? partReturn;
  final int? fullReturn;
  final int? wrp;
  final int? delayed;
  final int? changeData;
  final int? resend;
  final int? ready;

  const OrderStatusLengthModel({
    required this.inprogress,
    required this.recorded,
    required this.inTheWay,
    required this.delivered,
    required this.replace,
    required this.partReturn,
    required this.fullReturn,
    required this.wrp,
    required this.delayed,
    required this.changeData,
    required this.resend,
    required this.ready,
  });

  @override
  List<Object?> get props => [
        inprogress,
        recorded,
        inTheWay,
        delivered,
        replace,
        partReturn,
        fullReturn,
        wrp,
        delayed,
        changeData,
        resend,
        ready,
      ];

  factory OrderStatusLengthModel.fromJson(Map<String, dynamic> json) {
    return OrderStatusLengthModel(
      inprogress: json['inprogress'] as int,
      recorded: json['recorded'] as int,
      inTheWay: json['in-the-way'] as int,
      delivered: json['delivered'] as int,
      replace: json['replace'] as int,
      partReturn: json['part-return'] as int,
      fullReturn: json['full-return'] as int,
      wrp: json['wrp'] as int,
      delayed: json['delayed'] as int,
      changeData: json['change-data'] as int,
      resend: json['resend'] as int,
      ready: json['ready'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inprogress': inprogress,
      'recorded': recorded,
      'in-the-way': inTheWay,
      'delivered': delivered,
      'replace': replace,
      'part-return': partReturn,
      'full-return': fullReturn,
      'wrp': wrp,
      'delayed': delayed,
      'change-data': changeData,
      'resend': resend,
      'ready': ready,
    };
  }
}
