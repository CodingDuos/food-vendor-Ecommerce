// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:food_ecommerce/models/cart_product_model.dart';

class CartModel {
  final String? uuid;
  final List<CartProductModel>? product;
  final String? orderNumber;
  final String? transaction_uuid;
  final int? order_ticket_status_id;
  final int? sale_channel_id;
  String? customer_id;
  final int? location_id;
  final int? service_id;
  final int? orderStatusId;
  double? totalamount;

  CartModel({
    required this.uuid,
    this.product,
    required this.orderNumber,
    required this.transaction_uuid,
    required this.order_ticket_status_id,
    required this.sale_channel_id,
    required this.customer_id,
    required this.location_id,
    required this.service_id,
    required this.orderStatusId,
    required this.totalamount,
  });

  CartModel copyWith({
    String? uuid,
    List<CartProductModel>? product,
    String? orderNumber,
    String? transaction_uuid,
    int? order_ticket_status_id,
    int? sale_channel_id,
    String? customer_id,
    int? location_id,
    int? service_id,
    int? orderStatusId,
    double? totalamount,
  }) {
    return CartModel(
      uuid: uuid ?? this.uuid,
      product: product ?? this.product,
      orderNumber: orderNumber ?? this.orderNumber,
      transaction_uuid: transaction_uuid ?? this.transaction_uuid,
      order_ticket_status_id:
          order_ticket_status_id ?? this.order_ticket_status_id,
      sale_channel_id: sale_channel_id ?? this.sale_channel_id,
      customer_id: customer_id ?? this.customer_id,
      location_id: location_id ?? this.location_id,
      service_id: service_id ?? this.service_id,
      orderStatusId: orderStatusId ?? this.orderStatusId,
      totalamount: totalamount ?? this.totalamount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'product': product!.map((x) => x.toMap()).toList(),
      'orderNumber': orderNumber,
      'transaction_uuid': transaction_uuid,
      'order_ticket_status_id': order_ticket_status_id,
      'sale_channel_id': sale_channel_id,
      'customer_id': customer_id,
      'location_id': location_id,
      'service_id': service_id,
      'orderStatusId': orderStatusId,
      'totalamount': totalamount,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    List<CartProductModel> product = [];

    if (map['product'] != null) {
      product = List<CartProductModel>.from(map['product']?.map((x) {
        return CartProductModel.fromMap(x as Map<String, dynamic>);
      }));
    }

    return CartModel(
        uuid: map['uuid'],
        product: product,
        orderNumber: map['orderNumber'],
        transaction_uuid: map['transaction_uuid'],
        order_ticket_status_id: map['order_ticket_status_id'],
        sale_channel_id: map['sale_channel_id'],
        customer_id: map['customer_id'],
        location_id: map['location_id'],
        service_id: map['service_id'],
        orderStatusId: map['orderStatusId'],
        totalamount: map['totalamount']);
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(uuid: $uuid, product: $product, orderNumber: $orderNumber, transaction_uuid: $transaction_uuid, order_ticket_status_id: $order_ticket_status_id, sale_channel_id: $sale_channel_id, customer_id: $customer_id, location_id: $location_id, service_id: $service_id, orderStatusId: $orderStatusId, totalamount: $totalamount)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        listEquals(other.product, product) &&
        other.orderNumber == orderNumber &&
        other.transaction_uuid == transaction_uuid &&
        other.order_ticket_status_id == order_ticket_status_id &&
        other.sale_channel_id == sale_channel_id &&
        other.customer_id == customer_id &&
        other.location_id == location_id &&
        other.service_id == service_id &&
        other.orderStatusId == orderStatusId &&
        other.totalamount == totalamount;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        product.hashCode ^
        orderNumber.hashCode ^
        transaction_uuid.hashCode ^
        order_ticket_status_id.hashCode ^
        sale_channel_id.hashCode ^
        customer_id.hashCode ^
        location_id.hashCode ^
        service_id.hashCode ^
        orderStatusId.hashCode ^
        totalamount.hashCode;
  }
}
