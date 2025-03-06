import 'dart:convert';

import 'package:collection/collection.dart';

class UpcomingEvents {
  int? archtics;
  int? ticketmaster;
  int? total;
  int? filtered;

  UpcomingEvents({
    this.archtics,
    this.ticketmaster,
    this.total,
    this.filtered,
  });

  @override
  String toString() {
    return 'UpcomingEvents(archtics: $archtics, ticketmaster: $ticketmaster, total: $total, filtered: $filtered)';
  }

  factory UpcomingEvents.fromMap(Map<String, dynamic> data) {
    return UpcomingEvents(
      archtics: data['archtics'] as int?,
      ticketmaster: data['ticketmaster'] as int?,
      total: data['_total'] as int?,
      filtered: data['_filtered'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'archtics': archtics,
        'ticketmaster': ticketmaster,
        '_total': total,
        '_filtered': filtered,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UpcomingEvents].
  factory UpcomingEvents.fromJson(String data) {
    return UpcomingEvents.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UpcomingEvents] to a JSON string.
  String toJson() => json.encode(toMap());

  UpcomingEvents copyWith({
    int? archtics,
    int? ticketmaster,
    int? total,
    int? filtered,
  }) {
    return UpcomingEvents(
      archtics: archtics ?? this.archtics,
      ticketmaster: ticketmaster ?? this.ticketmaster,
      total: total ?? this.total,
      filtered: filtered ?? this.filtered,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UpcomingEvents) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      archtics.hashCode ^
      ticketmaster.hashCode ^
      total.hashCode ^
      filtered.hashCode;
}
