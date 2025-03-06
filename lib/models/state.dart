import 'dart:convert';

import 'package:collection/collection.dart';

class State {
  String? name;
  String? stateCode;

  State({this.name, this.stateCode});

  @override
  String toString() => 'State(name: $name, stateCode: $stateCode)';

  factory State.fromMap(Map<String, dynamic> data) => State(
        name: data['name'] as String?,
        stateCode: data['stateCode'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'stateCode': stateCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [State].
  factory State.fromJson(String data) {
    return State.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [State] to a JSON string.
  String toJson() => json.encode(toMap());

  State copyWith({
    String? name,
    String? stateCode,
  }) {
    return State(
      name: name ?? this.name,
      stateCode: stateCode ?? this.stateCode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! State) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ stateCode.hashCode;
}
