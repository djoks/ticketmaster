import 'dart:convert';

import 'package:collection/collection.dart';

class AgeRestrictions {
  bool? legalAgeEnforced;
  String? id;

  AgeRestrictions({this.legalAgeEnforced, this.id});

  @override
  String toString() {
    return 'AgeRestrictions(legalAgeEnforced: $legalAgeEnforced, id: $id)';
  }

  factory AgeRestrictions.fromMap(Map<String, dynamic> data) {
    return AgeRestrictions(
      legalAgeEnforced: data['legalAgeEnforced'] as bool?,
      id: data['id'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'legalAgeEnforced': legalAgeEnforced,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AgeRestrictions].
  factory AgeRestrictions.fromJson(String data) {
    return AgeRestrictions.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AgeRestrictions] to a JSON string.
  String toJson() => json.encode(toMap());

  AgeRestrictions copyWith({
    bool? legalAgeEnforced,
    String? id,
  }) {
    return AgeRestrictions(
      legalAgeEnforced: legalAgeEnforced ?? this.legalAgeEnforced,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AgeRestrictions) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => legalAgeEnforced.hashCode ^ id.hashCode;
}
