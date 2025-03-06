import 'dart:convert';

import 'package:collection/collection.dart';

import 'public.dart';

class Sales {
  Public? public;

  Sales({this.public});

  @override
  String toString() => 'Sales(public: $public)';

  factory Sales.fromMap(Map<String, dynamic> data) => Sales(
        public: data['public'] == null
            ? null
            : Public.fromMap(data['public'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'public': public?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Sales].
  factory Sales.fromJson(String data) {
    return Sales.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Sales] to a JSON string.
  String toJson() => json.encode(toMap());

  Sales copyWith({
    Public? public,
  }) {
    return Sales(
      public: public ?? this.public,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Sales) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => public.hashCode;
}
