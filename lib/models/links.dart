import 'dart:convert';

import 'package:collection/collection.dart';

import 'attraction.dart';
import 'self.dart';
import 'venue.dart';

class Links {
  Self? self;
  List<Attraction>? attractions;
  List<Venue>? venues;

  Links({this.self, this.attractions, this.venues});

  @override
  String toString() {
    return 'Links(self: $self, attractions: $attractions, venues: $venues)';
  }

  factory Links.fromMap(Map<String, dynamic> data) => Links(
        self: data['self'] == null
            ? null
            : Self.fromMap(data['self'] as Map<String, dynamic>),
        attractions: (data['attractions'] as List<dynamic>?)
            ?.map((e) => Attraction.fromMap(e as Map<String, dynamic>))
            .toList(),
        venues: (data['venues'] as List<dynamic>?)
            ?.map((e) => Venue.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'self': self?.toMap(),
        'attractions': attractions?.map((e) => e.toMap()).toList(),
        'venues': venues?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Links].
  factory Links.fromJson(String data) {
    return Links.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Links] to a JSON string.
  String toJson() => json.encode(toMap());

  Links copyWith({
    Self? self,
    List<Attraction>? attractions,
    List<Venue>? venues,
  }) {
    return Links(
      self: self ?? this.self,
      attractions: attractions ?? this.attractions,
      venues: venues ?? this.venues,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Links) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => self.hashCode ^ attractions.hashCode ^ venues.hashCode;
}
