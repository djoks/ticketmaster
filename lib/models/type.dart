import 'dart:convert';

import 'package:collection/collection.dart';

class Type {
  String? id;
  String? name;
  String? levelType;

  Type({this.id, this.name, this.levelType});

  @override
  String toString() => 'Type(id: $id, name: $name, levelType: $levelType)';

  factory Type.fromMap(Map<String, dynamic> data) => Type(
        id: data['id'] as String?,
        name: data['name'] as String?,
        levelType: data['levelType'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'levelType': levelType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Type].
  factory Type.fromJson(String data) {
    return Type.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Type] to a JSON string.
  String toJson() => json.encode(toMap());

  Type copyWith({
    String? id,
    String? name,
    String? levelType,
  }) {
    return Type(
      id: id ?? this.id,
      name: name ?? this.name,
      levelType: levelType ?? this.levelType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Type) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ levelType.hashCode;
}
