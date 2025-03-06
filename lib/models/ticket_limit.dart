import 'dart:convert';

import 'package:collection/collection.dart';

class TicketLimit {
  String? info;
  String? id;

  TicketLimit({this.info, this.id});

  @override
  String toString() => 'TicketLimit(info: $info, id: $id)';

  factory TicketLimit.fromMap(Map<String, dynamic> data) => TicketLimit(
        info: data['info'] as String?,
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'info': info,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TicketLimit].
  factory TicketLimit.fromJson(String data) {
    return TicketLimit.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TicketLimit] to a JSON string.
  String toJson() => json.encode(toMap());

  TicketLimit copyWith({
    String? info,
    String? id,
  }) {
    return TicketLimit(
      info: info ?? this.info,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TicketLimit) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => info.hashCode ^ id.hashCode;
}
