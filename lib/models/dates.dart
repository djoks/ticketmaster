import 'dart:convert';

import 'package:collection/collection.dart';

import 'start.dart';
import 'status.dart';

class Dates {
  Start? start;
  String? timezone;
  Status? status;
  bool? spanMultipleDays;

  Dates({this.start, this.timezone, this.status, this.spanMultipleDays});

  @override
  String toString() {
    return 'Dates(start: $start, timezone: $timezone, status: $status, spanMultipleDays: $spanMultipleDays)';
  }

  factory Dates.fromMap(Map<String, dynamic> data) => Dates(
        start: data['start'] == null
            ? null
            : Start.fromMap(data['start'] as Map<String, dynamic>),
        timezone: data['timezone'] as String?,
        status: data['status'] == null
            ? null
            : Status.fromMap(data['status'] as Map<String, dynamic>),
        spanMultipleDays: data['spanMultipleDays'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'start': start?.toMap(),
        'timezone': timezone,
        'status': status?.toMap(),
        'spanMultipleDays': spanMultipleDays,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Dates].
  factory Dates.fromJson(String data) {
    return Dates.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Dates] to a JSON string.
  String toJson() => json.encode(toMap());

  Dates copyWith({
    Start? start,
    String? timezone,
    Status? status,
    bool? spanMultipleDays,
  }) {
    return Dates(
      start: start ?? this.start,
      timezone: timezone ?? this.timezone,
      status: status ?? this.status,
      spanMultipleDays: spanMultipleDays ?? this.spanMultipleDays,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Dates) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      start.hashCode ^
      timezone.hashCode ^
      status.hashCode ^
      spanMultipleDays.hashCode;
}
