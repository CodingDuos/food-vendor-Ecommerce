// ignore_for_file: prefer_typing_uninitialized_variables

class LocationCategoryModel {
  int id;
  String uuid;
  int version;
  var localId;
  String backgroundColor;
  String textColor;
  int locationId;
  int categoryId;

  LocationCategoryModel(
      {required this.id,
      required this.uuid,
      required this.version,
      required this.localId,
      required this.backgroundColor,
      required this.textColor,
      required this.locationId,
      required this.categoryId});

  factory LocationCategoryModel.fromJson(Map<String, dynamic> json) {
    return LocationCategoryModel(
        id: json['id'],
        uuid: json['uuid'],
        version: json['version'],
        localId: json['local_id'] ?? '',
        backgroundColor: json['background_color'] ?? '',
        textColor: json['text_color'] ?? '',
        locationId: json['location_id'],
        categoryId: json['category_id'] ?? 0);
  }
}
