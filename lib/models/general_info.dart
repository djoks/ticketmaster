import 'dart:convert';

import 'package:collection/collection.dart';

class GeneralInfo {
  String? generalRule;
  String? childRule;

  GeneralInfo({this.generalRule, this.childRule});

  @override
  String toString() {
    return 'GeneralInfo(generalRule: $generalRule, childRule: $childRule)';
  }

  factory GeneralInfo.fromMap(Map<String, dynamic> data) => GeneralInfo(
        generalRule: data['generalRule'] as String?,
        childRule: data['childRule'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'generalRule': generalRule,
        'childRule': childRule,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GeneralInfo].
  factory GeneralInfo.fromJson(String data) {
    return GeneralInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GeneralInfo] to a JSON string.
  String toJson() => json.encode(toMap());

  GeneralInfo copyWith({
    String? generalRule,
    String? childRule,
  }) {
    return GeneralInfo(
      generalRule: generalRule ?? this.generalRule,
      childRule: childRule ?? this.childRule,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GeneralInfo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => generalRule.hashCode ^ childRule.hashCode;
}
