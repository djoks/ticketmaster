import 'dart:convert';

import 'package:collection/collection.dart';

class Seatmap {
  String? staticUrl;
  String? id;

  Seatmap({this.staticUrl, this.id});

  @override
  String toString() => 'Seatmap(staticUrl: $staticUrl, id: $id)';

  factory Seatmap.fromMap(Map<String, dynamic> data) => Seatmap(
        staticUrl: data['staticUrl'] as String?,
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'staticUrl': staticUrl,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Seatmap].
  factory Seatmap.fromJson(String data) {
    return Seatmap.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Seatmap] to a JSON string.
  String toJson() => json.encode(toMap());

  Seatmap copyWith({
    String? staticUrl,
    String? id,
  }) {
    return Seatmap(
      staticUrl: staticUrl ?? this.staticUrl,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Seatmap) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => staticUrl.hashCode ^ id.hashCode;
}
