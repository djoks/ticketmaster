import 'dart:convert';

import 'package:collection/collection.dart';

class SafeTix {
  bool? enabled;

  SafeTix({this.enabled});

  @override
  String toString() => 'SafeTix(enabled: $enabled)';

  factory SafeTix.fromMap(Map<String, dynamic> data) => SafeTix(
        enabled: data['enabled'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'enabled': enabled,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SafeTix].
  factory SafeTix.fromJson(String data) {
    return SafeTix.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SafeTix] to a JSON string.
  String toJson() => json.encode(toMap());

  SafeTix copyWith({
    bool? enabled,
  }) {
    return SafeTix(
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SafeTix) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => enabled.hashCode;
}
