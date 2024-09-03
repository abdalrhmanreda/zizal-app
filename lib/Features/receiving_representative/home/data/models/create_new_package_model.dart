import 'package:equatable/equatable.dart';

class CreateNewPackageModel extends Equatable {
  final int id;
  final int receiver;
  final String code;
  final bool receivedFromReceiver;

  const CreateNewPackageModel({
    required this.id,
    required this.receiver,
    required this.code,
    required this.receivedFromReceiver,
  });

  @override
  List<Object?> get props => [id, receiver, code, receivedFromReceiver];

  factory CreateNewPackageModel.fromJson(Map<String, dynamic> json) {
    return CreateNewPackageModel(
      id: json['id'],
      receiver: json['reciever'],
      code: json['code'],
      receivedFromReceiver: json['recieved_from_reciever'],
    );
  }
}
