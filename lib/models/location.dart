import 'dart:convert';

import 'package:collection/collection.dart';

class Location {
  String? longitude;
  String? latitude;

  Location({this.longitude, this.latitude});

  @override
  String toString() {
    return 'Location(longitude: $longitude, latitude: $latitude)';
  }

  factory Location.fromMap(Map<String, dynamic> data) => Location(
        longitude: data['longitude'] as String?,
        latitude: data['latitude'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'longitude': longitude,
        'latitude': latitude,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Location].
  factory Location.fromJson(String data) {
    return Location.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Location] to a JSON string.
  String toJson() => json.encode(toMap());

  Location copyWith({
    String? longitude,
    String? latitude,
  }) {
    return Location(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Location) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}
