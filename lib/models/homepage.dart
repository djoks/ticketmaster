import 'dart:convert';

import 'package:collection/collection.dart';

class Homepage {
  String? url;

  Homepage({this.url});

  @override
  String toString() => 'Homepage(url: $url)';

  factory Homepage.fromMap(Map<String, dynamic> data) => Homepage(
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Homepage].
  factory Homepage.fromJson(String data) {
    return Homepage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Homepage] to a JSON string.
  String toJson() => json.encode(toMap());

  Homepage copyWith({
    String? url,
  }) {
    return Homepage(
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Homepage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => url.hashCode;
}
