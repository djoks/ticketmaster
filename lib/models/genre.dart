import 'dart:convert';

import 'package:collection/collection.dart';

class Genre {
  String? id;
  String? name;
  String? levelType;

  Genre({this.id, this.name, this.levelType});

  @override
  String toString() => 'Genre(id: $id, name: $name, levelType: $levelType)';

  factory Genre.fromMap(Map<String, dynamic> data) => Genre(
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
  /// Parses the string and returns the resulting Json object as [Genre].
  factory Genre.fromJson(String data) {
    return Genre.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Genre] to a JSON string.
  String toJson() => json.encode(toMap());

  Genre copyWith({
    String? id,
    String? name,
    String? levelType,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
      levelType: levelType ?? this.levelType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Genre) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ levelType.hashCode;
}
