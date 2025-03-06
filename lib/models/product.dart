import 'dart:convert';

import 'package:collection/collection.dart';

import 'classification.dart';

class Product {
  String? name;
  String? id;
  String? url;
  String? type;
  List<Classification>? classifications;

  Product({this.name, this.id, this.url, this.type, this.classifications});

  @override
  String toString() {
    return 'Product(name: $name, id: $id, url: $url, type: $type, classifications: $classifications)';
  }

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        name: data['name'] as String?,
        id: data['id'] as String?,
        url: data['url'] as String?,
        type: data['type'] as String?,
        classifications: (data['classifications'] as List<dynamic>?)
            ?.map((e) => Classification.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'id': id,
        'url': url,
        'type': type,
        'classifications': classifications?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());

  Product copyWith({
    String? name,
    String? id,
    String? url,
    String? type,
    List<Classification>? classifications,
  }) {
    return Product(
      name: name ?? this.name,
      id: id ?? this.id,
      url: url ?? this.url,
      type: type ?? this.type,
      classifications: classifications ?? this.classifications,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Product) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      url.hashCode ^
      type.hashCode ^
      classifications.hashCode;
}
