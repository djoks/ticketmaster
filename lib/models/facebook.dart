import 'dart:convert';

import 'package:collection/collection.dart';

class Facebook {
  String? url;

  Facebook({this.url});

  @override
  String toString() => 'Facebook(url: $url)';

  factory Facebook.fromMap(Map<String, dynamic> data) => Facebook(
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Facebook].
  factory Facebook.fromJson(String data) {
    return Facebook.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Facebook] to a JSON string.
  String toJson() => json.encode(toMap());

  Facebook copyWith({
    String? url,
  }) {
    return Facebook(
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Facebook) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => url.hashCode;
}
