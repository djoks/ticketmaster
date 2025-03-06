import 'dart:convert';

import 'package:collection/collection.dart';

class Address {
  String? line1;

  Address({this.line1});

  @override
  String toString() => 'Address(line1: $line1)';

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        line1: data['line1'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'line1': line1,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());

  Address copyWith({
    String? line1,
  }) {
    return Address(
      line1: line1 ?? this.line1,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Address) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => line1.hashCode;
}
