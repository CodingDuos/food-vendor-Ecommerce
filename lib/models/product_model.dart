// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class ProductModel {
  int? id;
  String? name;
  num? buying_price;
  num? selling_price; // Change the type to num
  num? rr_price; // Change the type to num
  String? barcode;
  int? stock;
  String? uuid;

  ProductModel({
    this.id,
    this.name,
    this.uuid,
    this.buying_price,
    this.selling_price,
    this.rr_price,
    this.barcode,
    this.stock,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? uuid,
    double? buying_price,
    double? selling_price,
    double? rr_price,
    String? barcode,
    int? stock,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
      buying_price: buying_price ?? this.buying_price,
      selling_price: selling_price ?? this.selling_price,
      rr_price: rr_price ?? this.rr_price,
      barcode: barcode ?? this.barcode,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'name': name,
      'buying_price': buying_price,
      'selling_price': selling_price,
      'rr_price': rr_price,
      'barcode': barcode,
      'stock': stock,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id'],
        name: map['name'] ?? '',
        uuid: map['uuid'] ?? '',
        buying_price: map['buying_price'] ?? 0.0,
        selling_price: map['selling_price'] ?? 0.0,
        rr_price: map['rr_price'] ?? 0.0,
        barcode: map['barcode'] ?? '',
        stock: map['stock'] ?? 0);
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, buying_price: $buying_price, selling_price: $selling_price, rr_price: $rr_price, barcode: $barcode, stock: $stock, uuid: $uuid)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.name == name &&
        other.buying_price == buying_price &&
        other.selling_price == selling_price &&
        other.rr_price == rr_price &&
        other.barcode == barcode &&
        other.stock == stock;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        uuid.hashCode ^
        buying_price.hashCode ^
        selling_price.hashCode ^
        rr_price.hashCode ^
        barcode.hashCode ^
        stock.hashCode;
  }
}
