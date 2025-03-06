import 'dart:convert';

import 'package:collection/collection.dart';

class Segment {
  String? id;
  String? name;
  String? levelType;

  Segment({this.id, this.name, this.levelType});

  @override
  String toString() {
    return 'Segment(id: $id, name: $name, levelType: $levelType)';
  }

  factory Segment.fromMap(Map<String, dynamic> data) => Segment(
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
  /// Parses the string and returns the resulting Json object as [Segment].
  factory Segment.fromJson(String data) {
    return Segment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Segment] to a JSON string.
  String toJson() => json.encode(toMap());

  Segment copyWith({
    String? id,
    String? name,
    String? levelType,
  }) {
    return Segment(
      id: id ?? this.id,
      name: name ?? this.name,
      levelType: levelType ?? this.levelType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Segment) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ levelType.hashCode;
}
