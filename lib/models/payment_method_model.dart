// ignore_for_file: prefer_typing_uninitialized_variables

class PaymentMethodModel {
  var id;
  String uuid;
  int version;
  String type;
  String name;
  String description;
  var terminalId;
  var countryId;
  var businessTypeId;
  var paymentGetwayid;

  PaymentMethodModel(
      {required this.id,
      required this.uuid,
      required this.version,
      required this.name,
      required this.description,
      required this.type,
      required this.terminalId,
      required this.countryId,
      required this.businessTypeId,
      required this.paymentGetwayid});

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
        id: json['id'],
        uuid: json['uuid'],
        version: json['version'],
        name: json['name'],
        description: json['name'],
        type: json['type'],
        terminalId: json['terminal_id'],
        countryId: json['country_id'],
        businessTypeId: json['business_type_id'],
        paymentGetwayid: json['payment_gateway_id']);
  }
}
