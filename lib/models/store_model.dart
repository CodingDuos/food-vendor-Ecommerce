// ignore_for_file: prefer_typing_uninitialized_variables

class StoreModel {
  var id;
  String uuid;
  var version;
  var localId;
  String name;
  var description;
  var locationId;

  StoreModel(
      {required this.id,
      required this.uuid,
      required this.version,
      required this.localId,
      required this.name,
      required this.description,
      required this.locationId});

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
        id: json['id'],
        uuid: json['uuid'],
        version: json['version'],
        localId: json['local_id'],
        name: json['name'],
        description: json['description'],
        locationId: json['location_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'version': version,
      'location_id': locationId,
      'local_id': localId,
      'name': name,
      'description': description,
    };
  }
}
