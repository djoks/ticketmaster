import 'dart:convert';

import 'package:collection/collection.dart';

class Wiki {
  String? url;

  Wiki({this.url});

  @override
  String toString() => 'Wiki(url: $url)';

  factory Wiki.fromMap(Map<String, dynamic> data) => Wiki(
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Wiki].
  factory Wiki.fromJson(String data) {
    return Wiki.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Wiki] to a JSON string.
  String toJson() => json.encode(toMap());

  Wiki copyWith({
    String? url,
  }) {
    return Wiki(
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Wiki) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => url.hashCode;
}
