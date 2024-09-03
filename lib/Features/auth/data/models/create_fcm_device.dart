import 'package:equatable/equatable.dart';

class CreateFCMDeviceModel extends Equatable {
  final int id;
  final String name;
  final String registrationId;
  final String deviceId;
  final bool active;
  final DateTime dateCreated;
  final String type;

  const CreateFCMDeviceModel({
    required this.id,
    required this.name,
    required this.registrationId,
    required this.deviceId,
    required this.active,
    required this.dateCreated,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        registrationId,
        deviceId,
        active,
        dateCreated,
        type,
      ];

  factory CreateFCMDeviceModel.fromJson(Map<String, dynamic> json) {
    return CreateFCMDeviceModel(
      id: json['id'],
      name: json['name'],
      registrationId: json['registration_id'],
      deviceId: json['device_id'],
      active: json['active'],
      dateCreated: DateTime.parse(json['date_created']),
      type: json['type'],
    );
  }
}
