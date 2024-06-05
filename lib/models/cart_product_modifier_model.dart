import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CartProductModifier {
  final int? id;
  final String? title;
  final num? singlePrice;
  int? qty;
  final String? modifiersGroupUUid;
  final String? modifiersGroupName;
  String? uuid;
  int localId;
  double? tax;
  String? productUuid;

  num get totalPrice => singlePrice! * qty!;
  CartProductModifier({
    this.id,
    this.title,
    this.singlePrice,
    this.qty,
    this.modifiersGroupUUid,
    this.modifiersGroupName,
    this.uuid,
    required this.localId,
    this.tax,
    this.productUuid,
  });

  CartProductModifier copyWith({
    int? id,
    String? title,
    num? singlePrice,
    int? qty,
    String? modifiersGroupUUid,
    String? modifiersGroupName,
    String? uuid,
    int? localId,
    double? tax,
    String? productUuid,
  }) {
    return CartProductModifier(
      id: id ?? this.id,
      title: title ?? this.title,
      singlePrice: singlePrice ?? this.singlePrice,
      qty: qty ?? this.qty,
      modifiersGroupUUid: modifiersGroupUUid ?? this.modifiersGroupUUid,
      modifiersGroupName: modifiersGroupName ?? this.modifiersGroupName,
      uuid: uuid ?? this.uuid,
      localId: localId ?? this.localId,
      tax: tax ?? this.tax,
      productUuid: productUuid ?? this.productUuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'singlePrice': singlePrice,
      'qty': qty,
      'modifiersGroupUUid': modifiersGroupUUid,
      'modifiersGroupName': modifiersGroupName,
      'uuid': uuid,
      'localId': localId,
      'tax': tax,
      'productUuid': productUuid,
    };
  }

  Map<String, dynamic> toMapSupaBase() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'singlePrice': singlePrice,
      'qty': qty,
      'uuid': uuid,
      'localId': localId,
      'tax': tax,
      'productUuid': productUuid,
    };
  }

  factory CartProductModifier.fromMap(Map<String, dynamic> map) {
    return CartProductModifier(
      id: map['id'],
      title: map['title'] ?? '',
      singlePrice: map['singlePrice'] ?? 0,
      qty: map['qty'] ?? 0,
      uuid: map['uuid'] ?? '',
      modifiersGroupName: map['modifiersGroupName'] ?? '',
      modifiersGroupUUid: map['modifiersGroupUUid'] ?? '',
      localId: map['localId'] ?? 0,
      tax: map['tax'] ?? 0,
      productUuid: map['productUuid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductModifier.fromJson(String source) =>
      CartProductModifier.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartProductModifier(id: $id, title: $title, singlePrice: $singlePrice, qty: $qty, modifiersGroupUUid: $modifiersGroupUUid, modifiersGroupName: $modifiersGroupName, uuid: $uuid, localId: $localId, tax: $tax, productUuid: $productUuid)';
  }

  @override
  bool operator ==(covariant CartProductModifier other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.singlePrice == singlePrice &&
        other.qty == qty &&
        other.modifiersGroupUUid == modifiersGroupUUid &&
        other.modifiersGroupName == modifiersGroupName &&
        other.uuid == uuid &&
        other.localId == localId &&
        other.tax == tax &&
        other.productUuid == productUuid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        singlePrice.hashCode ^
        qty.hashCode ^
        modifiersGroupUUid.hashCode ^
        modifiersGroupName.hashCode ^
        uuid.hashCode ^
        localId.hashCode ^
        tax.hashCode ^
        productUuid.hashCode;
  }
}
