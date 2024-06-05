// ignore_for_file: prefer_typing_uninitialized_variables

class CategoriesModel {
  var id;
  String name;
  var uuid;
  CategoriesModel({required this.id, required this.name, this.uuid});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['name'],
      uuid: json['uuid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'uuid': uuid,
    };
  }
}
