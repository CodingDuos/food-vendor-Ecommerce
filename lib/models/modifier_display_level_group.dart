// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class ModifiersDisplayLevelModelGroup {
  String? group_name;
  String? modifier_group_uuid;
  int? id;
  ModifiersDisplayLevelModelGroup({
    this.group_name,
    this.modifier_group_uuid,
    this.id,
  });

  ModifiersDisplayLevelModelGroup copyWith({
    String? group_name,
    String? modifier_group_uuid,
    int? id,
  }) {
    return ModifiersDisplayLevelModelGroup(
      group_name: group_name ?? this.group_name,
      modifier_group_uuid: modifier_group_uuid ?? this.modifier_group_uuid,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': group_name,
      'modifier_group_uuid': modifier_group_uuid,
      'id': id,
    };
  }

  factory ModifiersDisplayLevelModelGroup.fromMap(Map<String, dynamic> map) {
    return ModifiersDisplayLevelModelGroup(
        group_name: map['name'] ?? '',
        modifier_group_uuid: map['modifier_group_uuid'] ?? '',
        id: map['id']);
  }

  String toJson() => json.encode(toMap());

  factory ModifiersDisplayLevelModelGroup.fromJson(String source) =>
      ModifiersDisplayLevelModelGroup.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ModifiersDisplayLevelModel(group_name: $group_name, modifier_group_uuid: $modifier_group_uuid, id: $id)';

  @override
  bool operator ==(covariant ModifiersDisplayLevelModelGroup other) {
    if (identical(this, other)) return true;

    return other.group_name == group_name &&
        other.modifier_group_uuid == modifier_group_uuid &&
        other.id == id;
  }

  @override
  int get hashCode =>
      group_name.hashCode ^ modifier_group_uuid.hashCode ^ id.hashCode;
}
