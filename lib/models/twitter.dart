import 'dart:convert';

import 'package:collection/collection.dart';

class Twitter {
  String? url;

  Twitter({this.url});

  @override
  String toString() => 'Twitter(url: $url)';

  factory Twitter.fromMap(Map<String, dynamic> data) => Twitter(
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Twitter].
  factory Twitter.fromJson(String data) {
    return Twitter.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Twitter] to a JSON string.
  String toJson() => json.encode(toMap());

  Twitter copyWith({
    String? url,
  }) {
    return Twitter(
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Twitter) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => url.hashCode;
}
