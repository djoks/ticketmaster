import 'dart:convert';

import 'package:collection/collection.dart';

class Market {
  String? name;
  String? id;

  Market({this.name, this.id});

  @override
  String toString() => 'Market(name: $name, id: $id)';

  factory Market.fromMap(Map<String, dynamic> data) => Market(
        name: data['name'] as String?,
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Market].
  factory Market.fromJson(String data) {
    return Market.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Market] to a JSON string.
  String toJson() => json.encode(toMap());

  Market copyWith({
    String? name,
    String? id,
  }) {
    return Market(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Market) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
