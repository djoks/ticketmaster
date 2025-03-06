import 'dart:convert';

import 'package:collection/collection.dart';

class PriceRange {
  String? type;
  String? currency;
  int? min;
  int? max;

  PriceRange({this.type, this.currency, this.min, this.max});

  @override
  String toString() {
    return 'PriceRange(type: $type, currency: $currency, min: $min, max: $max)';
  }

  factory PriceRange.fromMap(Map<String, dynamic> data) => PriceRange(
        type: data['type'] as String?,
        currency: data['currency'] as String?,
        min: data['min'] as int?,
        max: data['max'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'currency': currency,
        'min': min,
        'max': max,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PriceRange].
  factory PriceRange.fromJson(String data) {
    return PriceRange.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PriceRange] to a JSON string.
  String toJson() => json.encode(toMap());

  PriceRange copyWith({
    String? type,
    String? currency,
    int? min,
    int? max,
  }) {
    return PriceRange(
      type: type ?? this.type,
      currency: currency ?? this.currency,
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PriceRange) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      type.hashCode ^ currency.hashCode ^ min.hashCode ^ max.hashCode;
}
