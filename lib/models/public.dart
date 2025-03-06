import 'dart:convert';

import 'package:collection/collection.dart';

class Public {
  String? startDateTime;
  bool? startTbd;
  bool? startTba;
  String? endDateTime;

  Public({
    this.startDateTime,
    this.startTbd,
    this.startTba,
    this.endDateTime,
  });

  @override
  String toString() {
    return 'Public(startDateTime: $startDateTime, startTbd: $startTbd, startTba: $startTba, endDateTime: $endDateTime)';
  }

  factory Public.fromMap(Map<String, dynamic> data) => Public(
        startDateTime: data['startDateTime'] as String?,
        startTbd: data['startTBD'] as bool?,
        startTba: data['startTBA'] as bool?,
        endDateTime: data['endDateTime'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'startDateTime': startDateTime,
        'startTBD': startTbd,
        'startTBA': startTba,
        'endDateTime': endDateTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Public].
  factory Public.fromJson(String data) {
    return Public.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Public] to a JSON string.
  String toJson() => json.encode(toMap());

  Public copyWith({
    String? startDateTime,
    bool? startTbd,
    bool? startTba,
    String? endDateTime,
  }) {
    return Public(
      startDateTime: startDateTime ?? this.startDateTime,
      startTbd: startTbd ?? this.startTbd,
      startTba: startTba ?? this.startTba,
      endDateTime: endDateTime ?? this.endDateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Public) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      startDateTime.hashCode ^
      startTbd.hashCode ^
      startTba.hashCode ^
      endDateTime.hashCode;
}
