import 'dart:convert';

import 'package:collection/collection.dart';

class BoxOfficeInfo {
  String? phoneNumberDetail;
  String? openHoursDetail;
  String? acceptedPaymentDetail;
  String? willCallDetail;

  BoxOfficeInfo({
    this.phoneNumberDetail,
    this.openHoursDetail,
    this.acceptedPaymentDetail,
    this.willCallDetail,
  });

  @override
  String toString() {
    return 'BoxOfficeInfo(phoneNumberDetail: $phoneNumberDetail, openHoursDetail: $openHoursDetail, acceptedPaymentDetail: $acceptedPaymentDetail, willCallDetail: $willCallDetail)';
  }

  factory BoxOfficeInfo.fromMap(Map<String, dynamic> data) => BoxOfficeInfo(
        phoneNumberDetail: data['phoneNumberDetail'] as String?,
        openHoursDetail: data['openHoursDetail'] as String?,
        acceptedPaymentDetail: data['acceptedPaymentDetail'] as String?,
        willCallDetail: data['willCallDetail'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'phoneNumberDetail': phoneNumberDetail,
        'openHoursDetail': openHoursDetail,
        'acceptedPaymentDetail': acceptedPaymentDetail,
        'willCallDetail': willCallDetail,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BoxOfficeInfo].
  factory BoxOfficeInfo.fromJson(String data) {
    return BoxOfficeInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BoxOfficeInfo] to a JSON string.
  String toJson() => json.encode(toMap());

  BoxOfficeInfo copyWith({
    String? phoneNumberDetail,
    String? openHoursDetail,
    String? acceptedPaymentDetail,
    String? willCallDetail,
  }) {
    return BoxOfficeInfo(
      phoneNumberDetail: phoneNumberDetail ?? this.phoneNumberDetail,
      openHoursDetail: openHoursDetail ?? this.openHoursDetail,
      acceptedPaymentDetail:
          acceptedPaymentDetail ?? this.acceptedPaymentDetail,
      willCallDetail: willCallDetail ?? this.willCallDetail,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BoxOfficeInfo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      phoneNumberDetail.hashCode ^
      openHoursDetail.hashCode ^
      acceptedPaymentDetail.hashCode ^
      willCallDetail.hashCode;
}
