import 'dart:convert';

import 'package:collection/collection.dart';

class Status {
  String? code;

  Status({this.code});

  @override
  String toString() => 'Status(code: $code)';

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        code: data['code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Status].
  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Status] to a JSON string.
  String toJson() => json.encode(toMap());

  Status copyWith({
    String? code,
  }) {
    return Status(
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Status) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode;
}
