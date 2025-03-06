import 'dart:convert';

import 'package:collection/collection.dart';

import 'genre.dart';
import 'segment.dart';
import 'sub_genre.dart';
import 'sub_type.dart';
import 'type.dart';

class Classification {
  bool? primary;
  Segment? segment;
  Genre? genre;
  SubGenre? subGenre;
  Type? type;
  SubType? subType;
  bool? family;

  Classification({
    this.primary,
    this.segment,
    this.genre,
    this.subGenre,
    this.type,
    this.subType,
    this.family,
  });

  @override
  String toString() {
    return 'Classification(primary: $primary, segment: $segment, genre: $genre, subGenre: $subGenre, type: $type, subType: $subType, family: $family)';
  }

  factory Classification.fromMap(Map<String, dynamic> data) {
    return Classification(
      primary: data['primary'] as bool?,
      segment: data['segment'] == null
          ? null
          : Segment.fromMap(data['segment'] as Map<String, dynamic>),
      genre: data['genre'] == null
          ? null
          : Genre.fromMap(data['genre'] as Map<String, dynamic>),
      subGenre: data['subGenre'] == null
          ? null
          : SubGenre.fromMap(data['subGenre'] as Map<String, dynamic>),
      type: data['type'] == null
          ? null
          : Type.fromMap(data['type'] as Map<String, dynamic>),
      subType: data['subType'] == null
          ? null
          : SubType.fromMap(data['subType'] as Map<String, dynamic>),
      family: data['family'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'primary': primary,
        'segment': segment?.toMap(),
        'genre': genre?.toMap(),
        'subGenre': subGenre?.toMap(),
        'type': type?.toMap(),
        'subType': subType?.toMap(),
        'family': family,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Classification].
  factory Classification.fromJson(String data) {
    return Classification.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Classification] to a JSON string.
  String toJson() => json.encode(toMap());

  Classification copyWith({
    bool? primary,
    Segment? segment,
    Genre? genre,
    SubGenre? subGenre,
    Type? type,
    SubType? subType,
    bool? family,
  }) {
    return Classification(
      primary: primary ?? this.primary,
      segment: segment ?? this.segment,
      genre: genre ?? this.genre,
      subGenre: subGenre ?? this.subGenre,
      type: type ?? this.type,
      subType: subType ?? this.subType,
      family: family ?? this.family,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Classification) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      primary.hashCode ^
      segment.hashCode ^
      genre.hashCode ^
      subGenre.hashCode ^
      type.hashCode ^
      subType.hashCode ^
      family.hashCode;
}
