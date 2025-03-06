import 'dart:convert';

import 'package:collection/collection.dart';

import 'facebook.dart';
import 'homepage.dart';
import 'instagram.dart';
import 'twitter.dart';
import 'wiki.dart';

class ExternalLinks {
  List<Twitter>? twitter;
  List<Facebook>? facebook;
  List<Wiki>? wiki;
  List<Instagram>? instagram;
  List<Homepage>? homepage;

  ExternalLinks({
    this.twitter,
    this.facebook,
    this.wiki,
    this.instagram,
    this.homepage,
  });

  @override
  String toString() {
    return 'ExternalLinks(twitter: $twitter, facebook: $facebook, wiki: $wiki, instagram: $instagram, homepage: $homepage)';
  }

  factory ExternalLinks.fromMap(Map<String, dynamic> data) => ExternalLinks(
        twitter: (data['twitter'] as List<dynamic>?)
            ?.map((e) => Twitter.fromMap(e as Map<String, dynamic>))
            .toList(),
        facebook: (data['facebook'] as List<dynamic>?)
            ?.map((e) => Facebook.fromMap(e as Map<String, dynamic>))
            .toList(),
        wiki: (data['wiki'] as List<dynamic>?)
            ?.map((e) => Wiki.fromMap(e as Map<String, dynamic>))
            .toList(),
        instagram: (data['instagram'] as List<dynamic>?)
            ?.map((e) => Instagram.fromMap(e as Map<String, dynamic>))
            .toList(),
        homepage: (data['homepage'] as List<dynamic>?)
            ?.map((e) => Homepage.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'twitter': twitter?.map((e) => e.toMap()).toList(),
        'facebook': facebook?.map((e) => e.toMap()).toList(),
        'wiki': wiki?.map((e) => e.toMap()).toList(),
        'instagram': instagram?.map((e) => e.toMap()).toList(),
        'homepage': homepage?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExternalLinks].
  factory ExternalLinks.fromJson(String data) {
    return ExternalLinks.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExternalLinks] to a JSON string.
  String toJson() => json.encode(toMap());

  ExternalLinks copyWith({
    List<Twitter>? twitter,
    List<Facebook>? facebook,
    List<Wiki>? wiki,
    List<Instagram>? instagram,
    List<Homepage>? homepage,
  }) {
    return ExternalLinks(
      twitter: twitter ?? this.twitter,
      facebook: facebook ?? this.facebook,
      wiki: wiki ?? this.wiki,
      instagram: instagram ?? this.instagram,
      homepage: homepage ?? this.homepage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ExternalLinks) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      twitter.hashCode ^
      facebook.hashCode ^
      wiki.hashCode ^
      instagram.hashCode ^
      homepage.hashCode;
}
