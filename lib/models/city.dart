import 'dart:convert';

import 'package:collection/collection.dart';

class City {
  String? name;

  City({this.name});

  @override
  String toString() => 'City(name: $name)';

  factory City.fromMap(Map<String, dynamic> data) => City(
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [City].
  factory City.fromJson(String data) {
    return City.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [City] to a JSON string.
  String toJson() => json.encode(toMap());

  City copyWith({
    String? name,
  }) {
    return City(
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! City) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode;
}
