class DisplayLevelCategoriesModel {
  String name;
  int id;
  String uuid;

  DisplayLevelCategoriesModel(
      {required this.name, required this.id, required this.uuid});

  factory DisplayLevelCategoriesModel.fromJson(Map<String, dynamic> json) {
    return DisplayLevelCategoriesModel(
        name: json['name'], id: json['category_id'], uuid: json['uuid'] ?? '');
  }
}
