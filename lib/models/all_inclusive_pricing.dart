import 'dart:convert';

import 'package:collection/collection.dart';

class AllInclusivePricing {
  bool? enabled;

  AllInclusivePricing({this.enabled});

  @override
  String toString() => 'AllInclusivePricing(enabled: $enabled)';

  factory AllInclusivePricing.fromMap(Map<String, dynamic> data) {
    return AllInclusivePricing(
      enabled: data['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'enabled': enabled,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AllInclusivePricing].
  factory AllInclusivePricing.fromJson(String data) {
    return AllInclusivePricing.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllInclusivePricing] to a JSON string.
  String toJson() => json.encode(toMap());

  AllInclusivePricing copyWith({
    bool? enabled,
  }) {
    return AllInclusivePricing(
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AllInclusivePricing) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => enabled.hashCode;
}
