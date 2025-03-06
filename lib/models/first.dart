import 'dart:convert';

import 'package:collection/collection.dart';

class First {
  String? href;

  First({this.href});

  @override
  String toString() => 'First(href: $href)';

  factory First.fromMap(Map<String, dynamic> data) => First(
        href: data['href'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'href': href,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [First].
  factory First.fromJson(String data) {
    return First.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [First] to a JSON string.
  String toJson() => json.encode(toMap());

  First copyWith({
    String? href,
  }) {
    return First(
      href: href ?? this.href,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! First) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => href.hashCode;
}
