import 'dart:convert';

import 'package:collection/collection.dart';

class Page {
  int? size;
  int? totalElements;
  int? totalPages;
  int? number;

  Page({this.size, this.totalElements, this.totalPages, this.number});

  @override
  String toString() {
    return 'Page(size: $size, totalElements: $totalElements, totalPages: $totalPages, number: $number)';
  }

  factory Page.fromMap(Map<String, dynamic> data) => Page(
        size: data['size'] as int?,
        totalElements: data['totalElements'] as int?,
        totalPages: data['totalPages'] as int?,
        number: data['number'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'size': size,
        'totalElements': totalElements,
        'totalPages': totalPages,
        'number': number,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Page].
  factory Page.fromJson(String data) {
    return Page.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Page] to a JSON string.
  String toJson() => json.encode(toMap());

  Page copyWith({
    int? size,
    int? totalElements,
    int? totalPages,
    int? number,
  }) {
    return Page(
      size: size ?? this.size,
      totalElements: totalElements ?? this.totalElements,
      totalPages: totalPages ?? this.totalPages,
      number: number ?? this.number,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Page) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      size.hashCode ^
      totalElements.hashCode ^
      totalPages.hashCode ^
      number.hashCode;
}
