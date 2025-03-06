import 'dart:convert';

import 'package:collection/collection.dart';

class Last {
  String? href;

  Last({this.href});

  @override
  String toString() => 'Last(href: $href)';

  factory Last.fromMap(Map<String, dynamic> data) => Last(
        href: data['href'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'href': href,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Last].
  factory Last.fromJson(String data) {
    return Last.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Last] to a JSON string.
  String toJson() => json.encode(toMap());

  Last copyWith({
    String? href,
  }) {
    return Last(
      href: href ?? this.href,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Last) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => href.hashCode;
}
