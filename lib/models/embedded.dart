import 'dart:convert';

import 'package:collection/collection.dart';

import 'event.dart';

class Embedded {
  List<Event>? events;

  Embedded({this.events});

  @override
  String toString() => 'Embedded(events: $events)';

  factory Embedded.fromMap(Map<String, dynamic> data) => Embedded(
        events: (data['events'] as List<dynamic>?)
            ?.map((e) => Event.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'events': events?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Embedded].
  factory Embedded.fromJson(String data) {
    return Embedded.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Embedded] to a JSON string.
  String toJson() => json.encode(toMap());

  Embedded copyWith({
    List<Event>? events,
  }) {
    return Embedded(
      events: events ?? this.events,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Embedded) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => events.hashCode;
}
