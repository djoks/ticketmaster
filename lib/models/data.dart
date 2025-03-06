import 'dart:convert';

import 'package:collection/collection.dart';

import 'embedded.dart';
import 'links.dart';
import 'page.dart';

class Data {
  Embedded? embedded;
  Links? links;
  Page? page;

  Data({this.embedded, this.links, this.page});

  @override
  String toString() {
    return 'Data(embedded: $embedded, links: $links, page: $page)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        embedded: data['_embedded'] == null
            ? null
            : Embedded.fromMap(data['_embedded'] as Map<String, dynamic>),
        links: data['_links'] == null
            ? null
            : Links.fromMap(data['_links'] as Map<String, dynamic>),
        page: data['page'] == null
            ? null
            : Page.fromMap(data['page'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        '_embedded': embedded?.toMap(),
        '_links': links?.toMap(),
        'page': page?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    Embedded? embedded,
    Links? links,
    Page? page,
  }) {
    return Data(
      embedded: embedded ?? this.embedded,
      links: links ?? this.links,
      page: page ?? this.page,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => embedded.hashCode ^ links.hashCode ^ page.hashCode;
}
