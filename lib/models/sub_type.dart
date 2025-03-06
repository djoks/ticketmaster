import 'dart:convert';

import 'package:collection/collection.dart';

class SubType {
  String? id;
  String? name;
  String? levelType;

  SubType({this.id, this.name, this.levelType});

  @override
  String toString() {
    return 'SubType(id: $id, name: $name, levelType: $levelType)';
  }

  factory SubType.fromMap(Map<String, dynamic> data) => SubType(
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
  /// Parses the string and returns the resulting Json object as [SubType].
  factory SubType.fromJson(String data) {
    return SubType.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubType] to a JSON string.
  String toJson() => json.encode(toMap());

  SubType copyWith({
    String? id,
    String? name,
    String? levelType,
  }) {
    return SubType(
      id: id ?? this.id,
      name: name ?? this.name,
      levelType: levelType ?? this.levelType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SubType) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ levelType.hashCode;
}
