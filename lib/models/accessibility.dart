import 'dart:convert';

import 'package:collection/collection.dart';

class Accessibility {
  int? ticketLimit;
  String? id;

  Accessibility({this.ticketLimit, this.id});

  @override
  String toString() => 'Accessibility(ticketLimit: $ticketLimit, id: $id)';

  factory Accessibility.fromMap(Map<String, dynamic> data) => Accessibility(
        ticketLimit: data['ticketLimit'] as int?,
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'ticketLimit': ticketLimit,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Accessibility].
  factory Accessibility.fromJson(String data) {
    return Accessibility.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Accessibility] to a JSON string.
  String toJson() => json.encode(toMap());

  Accessibility copyWith({
    int? ticketLimit,
    String? id,
  }) {
    return Accessibility(
      ticketLimit: ticketLimit ?? this.ticketLimit,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Accessibility) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => ticketLimit.hashCode ^ id.hashCode;
}
