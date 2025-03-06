import 'dart:convert';

import 'package:collection/collection.dart';

class Instagram {
  String? url;

  Instagram({this.url});

  @override
  String toString() => 'Instagram(url: $url)';

  factory Instagram.fromMap(Map<String, dynamic> data) => Instagram(
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Instagram].
  factory Instagram.fromJson(String data) {
    return Instagram.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Instagram] to a JSON string.
  String toJson() => json.encode(toMap());

  Instagram copyWith({
    String? url,
  }) {
    return Instagram(
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Instagram) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => url.hashCode;
}
