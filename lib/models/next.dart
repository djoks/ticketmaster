import 'dart:convert';

import 'package:collection/collection.dart';

class Next {
  String? href;

  Next({this.href});

  @override
  String toString() => 'Next(href: $href)';

  factory Next.fromMap(Map<String, dynamic> data) => Next(
        href: data['href'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'href': href,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Next].
  factory Next.fromJson(String data) {
    return Next.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Next] to a JSON string.
  String toJson() => json.encode(toMap());

  Next copyWith({
    String? href,
  }) {
    return Next(
      href: href ?? this.href,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Next) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => href.hashCode;
}
