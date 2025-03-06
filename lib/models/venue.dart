import 'dart:convert';

import 'package:collection/collection.dart';

class Venue {
  String? href;

  Venue({this.href});

  @override
  String toString() => 'Venue(href: $href)';

  factory Venue.fromMap(Map<String, dynamic> data) => Venue(
        href: data['href'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'href': href,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Venue].
  factory Venue.fromJson(String data) {
    return Venue.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Venue] to a JSON string.
  String toJson() => json.encode(toMap());

  Venue copyWith({
    String? href,
  }) {
    return Venue(
      href: href ?? this.href,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Venue) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => href.hashCode;
}
