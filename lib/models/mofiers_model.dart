// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class ModifiersModel {
  int? id;
  String? name;
  String? uuid;
  num? cost_price;
  num? sale_price;
  int? stock;
  bool? isselected;
  num? tax;

  int? quantity;
  ModifiersModel({
    this.isselected,
    this.id,
    this.name,
    this.uuid,
    this.quantity,
    this.cost_price,
    this.sale_price,
    this.stock,
    this.tax,
  });

  num get totalPrice => sale_price! * quantity!;

  ModifiersModel copyWith({
    int? id,
    String? name,
    num? cost_price,
    num? sale_price,
    int? stock,
    num? tax,
  }) {
    return ModifiersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cost_price: cost_price ?? this.cost_price,
      sale_price: sale_price ?? this.sale_price,
      stock: stock ?? this.stock,
      tax: tax ?? this.tax,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cost_price': cost_price,
      'sale_price': sale_price,
      'stock': stock,
      'tax': tax,
    };
  }

  factory ModifiersModel.fromMap(Map<String, dynamic> map) {
    return ModifiersModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] ?? '',
      isselected: false,
      quantity: 1,
      uuid: map['uuid'] ?? '',
      cost_price: map['cost_price'] ?? 0.0,
      sale_price: map['sale_price'] ?? 0.0,
      stock: map['stock'] ?? 0,
      tax: map['tax'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifiersModel.fromJson(String source) =>
      ModifiersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModifiersModel(id: $id, name: $name, cost_price: $cost_price, sale_price: $sale_price, stock: $stock, tax: $tax)';
  }

  @override
  bool operator ==(covariant ModifiersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.cost_price == cost_price &&
        other.sale_price == sale_price &&
        other.stock == stock &&
        other.tax == tax;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        cost_price.hashCode ^
        sale_price.hashCode ^
        stock.hashCode ^
        tax.hashCode;
  }
}
