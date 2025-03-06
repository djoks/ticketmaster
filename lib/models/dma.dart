import 'dart:convert';

import 'package:collection/collection.dart';

class Dma {
  int? id;

  Dma({this.id});

  @override
  String toString() => 'Dma(id: $id)';

  factory Dma.fromMap(Map<String, dynamic> data) => Dma(
        id: data['id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Dma].
  factory Dma.fromJson(String data) {
    return Dma.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Dma] to a JSON string.
  String toJson() => json.encode(toMap());

  Dma copyWith({
    int? id,
  }) {
    return Dma(
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Dma) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode;
}
