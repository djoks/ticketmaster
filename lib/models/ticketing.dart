import 'dart:convert';

import 'package:collection/collection.dart';

import 'all_inclusive_pricing.dart';
import 'safe_tix.dart';

class Ticketing {
  SafeTix? safeTix;
  AllInclusivePricing? allInclusivePricing;
  String? id;

  Ticketing({this.safeTix, this.allInclusivePricing, this.id});

  @override
  String toString() {
    return 'Ticketing(safeTix: $safeTix, allInclusivePricing: $allInclusivePricing, id: $id)';
  }

  factory Ticketing.fromMap(Map<String, dynamic> data) => Ticketing(
        safeTix: data['safeTix'] == null
            ? null
            : SafeTix.fromMap(data['safeTix'] as Map<String, dynamic>),
        allInclusivePricing: data['allInclusivePricing'] == null
            ? null
            : AllInclusivePricing.fromMap(
                data['allInclusivePricing'] as Map<String, dynamic>),
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'safeTix': safeTix?.toMap(),
        'allInclusivePricing': allInclusivePricing?.toMap(),
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Ticketing].
  factory Ticketing.fromJson(String data) {
    return Ticketing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Ticketing] to a JSON string.
  String toJson() => json.encode(toMap());

  Ticketing copyWith({
    SafeTix? safeTix,
    AllInclusivePricing? allInclusivePricing,
    String? id,
  }) {
    return Ticketing(
      safeTix: safeTix ?? this.safeTix,
      allInclusivePricing: allInclusivePricing ?? this.allInclusivePricing,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Ticketing) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      safeTix.hashCode ^ allInclusivePricing.hashCode ^ id.hashCode;
}
