import 'dart:convert';

import 'package:collection/collection.dart';

class Attraction {
  String? href;

  Attraction({this.href});

  @override
  String toString() => 'Attraction(href: $href)';

  factory Attraction.fromMap(Map<String, dynamic> data) => Attraction(
        href: data['href'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'href': href,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attraction].
  factory Attraction.fromJson(String data) {
    return Attraction.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attraction] to a JSON string.
  String toJson() => json.encode(toMap());

  Attraction copyWith({
    String? href,
  }) {
    return Attraction(
      href: href ?? this.href,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Attraction) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => href.hashCode;
}
