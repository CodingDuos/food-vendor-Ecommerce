// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServicesTypeModel {
  String? name;
  String? uuid;
  int? id;
  int? locationId;

  ServicesTypeModel(
      {required this.id,
      required this.name,
      required this.uuid,
      required this.locationId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uuid': uuid,
      'id': id,
    };
  }

  factory ServicesTypeModel.fromMap(Map<String, dynamic> map) {
    return ServicesTypeModel(
        name: map['name'] ?? '',
        uuid: map['uuid'] ?? '',
        id: map['id'],
        locationId: map['location_id']);
  }

  String toJson() => json.encode(toMap());

  factory ServicesTypeModel.fromJson(String source) =>
      ServicesTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
