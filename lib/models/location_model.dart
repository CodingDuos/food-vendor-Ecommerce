// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationModel {
  int id;
  String? uuid;
  String? bussinessName;
  String? telephoneNumber;
  String? email;
  String? address;
  String? website;
  String? logo;
  int? countryId;
  LocationModel({
    required this.id,
    this.uuid,
    this.bussinessName,
    this.telephoneNumber,
    this.countryId,
    this.email,
    this.address,
    this.website,
    this.logo,
  });

  LocationModel copyWith(
      {int? id,
      String? uuid,
      int? countryId,
      String? bussinessName,
      String? telephoneNumber,
      String? email,
      String? address,
      String? website,
      String? logo,
      int? co}) {
    return LocationModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      countryId: countryId ?? this.countryId,
      bussinessName: bussinessName ?? this.bussinessName,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      email: email ?? this.email,
      address: address ?? this.address,
      website: website ?? this.website,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'bussinessName': bussinessName,
      'telephoneNumber': telephoneNumber,
      'email': email,
      'address': address,
      'website': website,
      'country_id': countryId,
      'logo': logo,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'],
      countryId: map['country_id'] ?? 0,
      uuid: map['uuid'] ?? '',
      bussinessName: map['business_name'] ?? '',
      telephoneNumber: map['telephone_number'] ?? '',
      email: map['email'] ?? '',
      address: map['street_address'] ?? '',
      website: map['website'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocationModel(id: $id, uuid: $uuid, bussinessName: $bussinessName, telephoneNumber: $telephoneNumber, email: $email, address: $address, website: $website, logo: $logo)';
  }

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.bussinessName == bussinessName &&
        other.telephoneNumber == telephoneNumber &&
        other.email == email &&
        other.address == address &&
        other.website == website &&
        other.logo == logo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        bussinessName.hashCode ^
        telephoneNumber.hashCode ^
        email.hashCode ^
        address.hashCode ^
        website.hashCode ^
        logo.hashCode;
  }
}
