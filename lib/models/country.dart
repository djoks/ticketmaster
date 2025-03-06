import 'dart:convert';

import 'package:collection/collection.dart';

class Country {
  String? name;
  String? countryCode;

  Country({this.name, this.countryCode});

  @override
  String toString() => 'Country(name: $name, countryCode: $countryCode)';

  factory Country.fromMap(Map<String, dynamic> data) => Country(
        name: data['name'] as String?,
        countryCode: data['countryCode'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'countryCode': countryCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Country].
  factory Country.fromJson(String data) {
    return Country.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Country] to a JSON string.
  String toJson() => json.encode(toMap());

  Country copyWith({
    String? name,
    String? countryCode,
  }) {
    return Country(
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Country) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ countryCode.hashCode;
}
