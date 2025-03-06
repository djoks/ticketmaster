import 'dart:convert';

import 'package:collection/collection.dart';

class Start {
  String? localDate;
  String? localTime;
  String? dateTime;
  bool? dateTbd;
  bool? dateTba;
  bool? timeTba;
  bool? noSpecificTime;

  Start({
    this.localDate,
    this.localTime,
    this.dateTime,
    this.dateTbd,
    this.dateTba,
    this.timeTba,
    this.noSpecificTime,
  });

  @override
  String toString() {
    return 'Start(localDate: $localDate, localTime: $localTime, dateTime: $dateTime, dateTbd: $dateTbd, dateTba: $dateTba, timeTba: $timeTba, noSpecificTime: $noSpecificTime)';
  }

  factory Start.fromMap(Map<String, dynamic> data) => Start(
        localDate: data['localDate'] as String?,
        localTime: data['localTime'] as String?,
        dateTime: data['dateTime'] as String?,
        dateTbd: data['dateTBD'] as bool?,
        dateTba: data['dateTBA'] as bool?,
        timeTba: data['timeTBA'] as bool?,
        noSpecificTime: data['noSpecificTime'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'localDate': localDate,
        'localTime': localTime,
        'dateTime': dateTime,
        'dateTBD': dateTbd,
        'dateTBA': dateTba,
        'timeTBA': timeTba,
        'noSpecificTime': noSpecificTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Start].
  factory Start.fromJson(String data) {
    return Start.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Start] to a JSON string.
  String toJson() => json.encode(toMap());

  Start copyWith({
    String? localDate,
    String? localTime,
    String? dateTime,
    bool? dateTbd,
    bool? dateTba,
    bool? timeTba,
    bool? noSpecificTime,
  }) {
    return Start(
      localDate: localDate ?? this.localDate,
      localTime: localTime ?? this.localTime,
      dateTime: dateTime ?? this.dateTime,
      dateTbd: dateTbd ?? this.dateTbd,
      dateTba: dateTba ?? this.dateTba,
      timeTba: timeTba ?? this.timeTba,
      noSpecificTime: noSpecificTime ?? this.noSpecificTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Start) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      localDate.hashCode ^
      localTime.hashCode ^
      dateTime.hashCode ^
      dateTbd.hashCode ^
      dateTba.hashCode ^
      timeTba.hashCode ^
      noSpecificTime.hashCode;
}
