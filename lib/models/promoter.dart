import 'dart:convert';

import 'package:collection/collection.dart';

class Promoter {
  String? id;
  String? name;
  String? description;

  Promoter({this.id, this.name, this.description});

  @override
  String toString() {
    return 'Promoter(id: $id, name: $name, description: $description)';
  }

  factory Promoter.fromMap(Map<String, dynamic> data) => Promoter(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Promoter].
  factory Promoter.fromJson(String data) {
    return Promoter.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Promoter] to a JSON string.
  String toJson() => json.encode(toMap());

  Promoter copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return Promoter(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Promoter) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
