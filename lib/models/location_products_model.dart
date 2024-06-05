// ignore_for_file: prefer_typing_uninitialized_variables

class LocationProductsModel {
  var buyingPrice;
  var sellingPrice;
  String title;
  var id;
  var stock;
  var barcode;
  var rrPrice;

  LocationProductsModel({
    required this.title,
    required this.id,
    required this.buyingPrice,
    required this.rrPrice,
    required this.barcode,
    required this.stock,
    required this.sellingPrice,
  });

  factory LocationProductsModel.fromJson(Map<String, dynamic> json) {
    return LocationProductsModel(
      title: json['title'],
      id: json['id'],
      buyingPrice: json['buying_price'],
      barcode: json['barcode'],
      stock: json['stock'],
      rrPrice: json['rr_price'],
      sellingPrice: json['selling_price'],
    );
  }
}
