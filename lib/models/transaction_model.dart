// ignore_for_file: prefer_typing_uninitialized_variables

class TransactionModel {
  var id;
  String uuid;
  var version;
  var localId;
  var number;
  var status;
  var payments;
  var completedAt;
  var locationId;
  var customerId;
  var orderId;

  TransactionModel(
      {required this.id,
      required this.uuid,
      required this.version,
      required this.localId,
      required this.customerId,
      required this.number,
      required this.locationId,
      required this.status,
      required this.completedAt,
      required this.orderId,
      required this.payments});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        id: json['id'],
        uuid: json['uuid'],
        version: json['version'],
        localId: json['local_id'],
        customerId: json['customer_id'],
        number: json['number'],
        locationId: json['location_id'],
        status: json['status'],
        completedAt: json['completed_at'],
        orderId: json['order_id'],
        payments: json['payments']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'version': version,
      'local_id': localId,
      'customer_id': customerId,
      'number': number,
      'location_id': locationId,
      'status': status,
      'completed_at': completedAt,
      'order_id': orderId,
      'payments': payments
    };
  }
}
