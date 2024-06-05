// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

class OrderModel {
  var id;
  var uuid;
  var version;
  var localId;
  final List<OrderProductModel> products;
  var orderNumber;
  var serviceId;
  var transactionId;
  var orderTicketStatusId;
  var orderSourceId;
  var customerId;

  OrderModel({
    required this.id,
    required this.uuid,
    required this.version,
    required this.localId,
    required this.products,
    required this.orderNumber,
    required this.serviceId,
    required this.transactionId,
    required this.orderTicketStatusId,
    required this.orderSourceId,
    required this.customerId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    // Parse the "products" field as a dynamic
    dynamic productsJson = json['products'];

    List<OrderProductModel> products = [];

    // Check if the "products" field is a string
    if (productsJson is String) {
      // Handle the case where "products" is a string, you can convert it to a list or handle it as needed
      // For example, if it's a JSON string, you can parse it
      final List<dynamic> productList = jsonDecode(productsJson);
      products = productList.map((productJson) {
        return OrderProductModel.fromJson(productJson);
      }).toList();
    } else if (productsJson is List<dynamic>) {
      // Handle the case where "products" is already a list
      products = productsJson.map((productJson) {
        return OrderProductModel.fromJson(productJson);
      }).toList();
    }

    return OrderModel(
      id: json['id'],
      uuid: json['uuid'],
      version: json['version'],
      localId: json['local_id'],
      products: products,
      orderNumber: json['order_number'],
      serviceId: json['service_id'],
      transactionId: json['transaction_id'],
      orderTicketStatusId: json['order_ticket_status_id'],
      orderSourceId: json['order_source_id'],
      customerId: json['customer_id'],
    );
  }
}

class OrderProductModel {
  final int id; // You can change the data type as needed
  final String name; // You can add more fields as needed
  var price;

  OrderProductModel(
      {required this.id, required this.name, required this.price});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
        id: json['id'], name: json['name'], price: json['price']);
  }
}
