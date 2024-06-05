// ignore_for_file: prefer_typing_uninitialized_variables

class OrderTicketStatusModel {
  int id;
  String uuid;
  int version;
  String name;
  var description;
  var businessTypeId;
  OrderTicketStatusModel(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.version,
      required this.description,
      required this.businessTypeId});

  factory OrderTicketStatusModel.fromJson(Map<String, dynamic> json) {
    return OrderTicketStatusModel(
        id: json['id'],
        uuid: json['uuid'],
        name: json['name'],
        version: json['version'],
        description: json['description'],
        businessTypeId: json['business_type_id']);
  }
}
