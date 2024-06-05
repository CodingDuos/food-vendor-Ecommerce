
class ModifierDisplayLevelGroupModel{
  int id;
  String groupName;
  int productId;

  ModifierDisplayLevelGroupModel({required this.id,required this.groupName,required this.productId});

  factory ModifierDisplayLevelGroupModel.fromJson(Map<String,dynamic> json){
    return ModifierDisplayLevelGroupModel(
        id: json['id'],
        productId: json['product_id'],
        groupName: json['group_name']
    );
  }
}