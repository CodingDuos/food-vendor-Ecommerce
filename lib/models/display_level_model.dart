// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DisplayLevelModel {
  int? id;
  String? uuid;
  int? locationId;
  DisplayLevelModel({
    this.id,
    this.locationId,
    this.uuid,
  });

  DisplayLevelModel copyWith(
      {String? name, int? id, String? uuid, int? locationId}) {
    return DisplayLevelModel(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'uuid': uuid, 'location_id': locationId};
  }

  factory DisplayLevelModel.fromMap(Map<String, dynamic> map) {
    return DisplayLevelModel(
      id: map['id'],
      locationId: map['location_id'],
      uuid: map['uuid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayLevelModel.fromJson(String source) =>
      DisplayLevelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DisplayLevelModel( id: $id, uuid: $uuid)';

  @override
  bool operator ==(covariant DisplayLevelModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.uuid == uuid;
  }

  @override
  int get hashCode => id.hashCode ^ uuid.hashCode;
}
