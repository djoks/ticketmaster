import 'dart:convert';

import 'package:collection/collection.dart';

class Image {
  String? ratio;
  String? url;
  int? width;
  int? height;
  bool? fallback;

  Image({this.ratio, this.url, this.width, this.height, this.fallback});

  @override
  String toString() {
    return 'Image(ratio: $ratio, url: $url, width: $width, height: $height, fallback: $fallback)';
  }

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        ratio: data['ratio'] as String?,
        url: data['url'] as String?,
        width: data['width'] as int?,
        height: data['height'] as int?,
        fallback: data['fallback'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'ratio': ratio,
        'url': url,
        'width': width,
        'height': height,
        'fallback': fallback,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
  factory Image.fromJson(String data) {
    return Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
  String toJson() => json.encode(toMap());

  Image copyWith({
    String? ratio,
    String? url,
    int? width,
    int? height,
    bool? fallback,
  }) {
    return Image(
      ratio: ratio ?? this.ratio,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      fallback: fallback ?? this.fallback,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Image) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      ratio.hashCode ^
      url.hashCode ^
      width.hashCode ^
      height.hashCode ^
      fallback.hashCode;
}
