import 'dart:convert';

import 'package:collection/collection.dart';

class SubGenre {
  String? id;
  String? name;
  String? levelType;

  SubGenre({this.id, this.name, this.levelType});

  @override
  String toString() {
    return 'SubGenre(id: $id, name: $name, levelType: $levelType)';
  }

  factory SubGenre.fromMap(Map<String, dynamic> data) => SubGenre(
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
  /// Parses the string and returns the resulting Json object as [SubGenre].
  factory SubGenre.fromJson(String data) {
    return SubGenre.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubGenre] to a JSON string.
  String toJson() => json.encode(toMap());

  SubGenre copyWith({
    String? id,
    String? name,
    String? levelType,
  }) {
    return SubGenre(
      id: id ?? this.id,
      name: name ?? this.name,
      levelType: levelType ?? this.levelType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SubGenre) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ levelType.hashCode;
}
