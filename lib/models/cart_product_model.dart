// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:food_ecommerce/models/cart_product_modifier_model.dart';

class CartProductModel {
  final String? uuid;
  final String? title;
  final num? singlePrice;
  int? qty;
  final num? tax;
  final String? taxType;
  final String? categoryUuid;
  final String? brandUuid;
  final String? departmentUuid;
  final List<CartProductModifier> modifiers;

  int? localId;

  int? productTypeId;
  double? weight;
  String? groupUuid;

  double get totalPrice =>
      (qty! * singlePrice!) +
      modifiers.fold(
          0, (previousValue, element) => previousValue + element.totalPrice);
  CartProductModel({
    this.uuid,
    this.title,
    this.singlePrice,
    this.qty,
    this.tax,
    this.taxType,
    this.categoryUuid,
    this.brandUuid,
    this.departmentUuid,
    required this.modifiers,
    this.localId,
    this.productTypeId,
    this.weight,
    this.groupUuid,
  });

  // CartProductModel({
  //   required this.localId,
  //   required this.productTypeId,
  //   required this.weight,
  //   required this.groupUuid,
  //   required this.uuid,
  //   required this.title,
  //   required this.singlePrice,
  //   required this.qty,
  //   required this.tax,
  //   required this.taxType,
  //   required this.categoryUuid,
  //   required this.brandUuid,
  //   required this.departmentUuid,
  //   required this.modifiers,
  // });

  // double get totalPrice =>
  //     (qty! * singlePrice!) +
  //     modifiers.fold(
  //         0, (previousValue, element) => previousValue + element.totalPrice);

  // get tojsonget => toJson();

  // Map<String, dynamic> toJson() {
  //   return {
  //     'uuid': uuid,
  //     'title': title,
  //     'singlePrice': singlePrice,
  //     'qty': qty,
  //     'tax': tax,
  //     'taxType': taxType,
  //     'categoryUuid': categoryUuid,
  //     'brandUuid': brandUuid,
  //     'departmentUuid': departmentUuid,
  //     'modifiers': modifiers.map((modifier) => modifier.toJson()).toList(),
  //   };
  // }

  // factory CartProductModel.fromMap(Map<String, dynamic> map) {
  //   return CartProductModel(
  //     localId: map['localId'],
  //     productTypeId: map['productTypeId'],
  //     weight: map['weight'],
  //     groupUuid: map['groupUuid'],
  //     uuid: map['uuid'],
  //     title: map['title'],
  //     singlePrice: map['singlePrice'],
  //     qty: map['qty'],
  //     tax: map['tax'],
  //     taxType: map['taxType'],
  //     categoryUuid: map['categoryUuid'],
  //     brandUuid: map['brandUuid'],
  //     departmentUuid: map['departmentUuid'],
  //     modifiers: map['modifiers'] as List<CartProductModifier>,
  //   );
  // }

  CartProductModel copyWith({
    String? uuid,
    String? title,
    num? singlePrice,
    int? qty,
    num? tax,
    String? taxType,
    String? categoryUuid,
    String? brandUuid,
    String? departmentUuid,
    List<CartProductModifier>? modifiers,
    int? localId,
    int? productTypeId,
    double? weight,
    String? groupUuid,
  }) {
    return CartProductModel(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      singlePrice: singlePrice ?? this.singlePrice,
      qty: qty ?? this.qty,
      tax: tax ?? this.tax,
      taxType: taxType ?? this.taxType,
      categoryUuid: categoryUuid ?? this.categoryUuid,
      brandUuid: brandUuid ?? this.brandUuid,
      departmentUuid: departmentUuid ?? this.departmentUuid,
      modifiers: modifiers ?? this.modifiers,
      localId: localId ?? this.localId,
      productTypeId: productTypeId ?? this.productTypeId,
      weight: weight ?? this.weight,
      groupUuid: groupUuid ?? this.groupUuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'title': title,
      'singlePrice': singlePrice,
      'qty': qty,
      'tax': tax,
      'taxType': taxType,
      'categoryUuid': categoryUuid,
      'brandUuid': brandUuid,
      'departmentUuid': departmentUuid,
      'modifiers': modifiers.map((x) => x.toMap()).toList(),
      'localId': localId,
      'productTypeId': productTypeId,
      'weight': weight,
      'groupUuid': groupUuid,
    };
  }

  factory CartProductModel.fromMap(Map<String, dynamic> map) {
    List<CartProductModifier> modifiers = [];

    if (map['modifiers'] != null) {
      modifiers = List<CartProductModifier>.from(
          map['modifiers']?.map((x) => CartProductModifier.fromMap(x)));
    }
    return CartProductModel(
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      singlePrice:
          map['singlePrice'] != null ? map['singlePrice'] as num : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
      tax: map['tax'] != null ? map['tax'] as num : null,
      taxType: map['taxType'] != null ? map['taxType'] as String : null,
      categoryUuid:
          map['categoryUuid'] != null ? map['categoryUuid'] as String : null,
      brandUuid: map['brandUuid'] != null ? map['brandUuid'] as String : null,
      departmentUuid: map['departmentUuid'] != null
          ? map['departmentUuid'] as String
          : null,
      modifiers: modifiers,
      localId: map['localId'] != null ? map['localId'] as int : null,
      productTypeId:
          map['productTypeId'] != null ? map['productTypeId'] as int : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      groupUuid: map['groupUuid'] != null ? map['groupUuid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductModel.fromJson(String source) =>
      CartProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartProductModel(uuid: $uuid, title: $title, singlePrice: $singlePrice, qty: $qty, tax: $tax, taxType: $taxType, categoryUuid: $categoryUuid, brandUuid: $brandUuid, departmentUuid: $departmentUuid, modifiers: $modifiers, localId: $localId, productTypeId: $productTypeId, weight: $weight, groupUuid: $groupUuid)';
  }

  @override
  bool operator ==(covariant CartProductModel other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.title == title &&
        other.singlePrice == singlePrice &&
        other.qty == qty &&
        other.tax == tax &&
        other.taxType == taxType &&
        other.categoryUuid == categoryUuid &&
        other.brandUuid == brandUuid &&
        other.departmentUuid == departmentUuid &&
        listEquals(other.modifiers, modifiers) &&
        other.localId == localId &&
        other.productTypeId == productTypeId &&
        other.weight == weight &&
        other.groupUuid == groupUuid;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        title.hashCode ^
        singlePrice.hashCode ^
        qty.hashCode ^
        tax.hashCode ^
        taxType.hashCode ^
        categoryUuid.hashCode ^
        brandUuid.hashCode ^
        departmentUuid.hashCode ^
        modifiers.hashCode ^
        localId.hashCode ^
        productTypeId.hashCode ^
        weight.hashCode ^
        groupUuid.hashCode;
  }
}
