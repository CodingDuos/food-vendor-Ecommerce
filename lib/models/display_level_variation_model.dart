
class DisplayLevelVariationModel{
  String name;
  int id;

  DisplayLevelVariationModel({required this.id,required this.name});

  factory DisplayLevelVariationModel.fromJson(Map<String,dynamic> json){
    return DisplayLevelVariationModel(
        id: json['variation_id']??-1,
        name: json['name']
    );
  }
}