// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fanFundingEventDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FanFundingEventDetails _$FanFundingEventDetailsFromJson(
    Map<String, dynamic> json) {
  return FanFundingEventDetails(
    amountMicros: json['amountMicros'] as int?,
    currency: json['currency'] as String?,
    amountDisplayString: json['amountDisplayString'] as String?,
    userComment: json['userComment'] as String?,
  );
}

Map<String, dynamic> _$FanFundingEventDetailsToJson(
        FanFundingEventDetails instance) =>
    <String, dynamic>{
      'amountMicros': instance.amountMicros,
      'currency': instance.currency,
      'amountDisplayString': instance.amountDisplayString,
      'userComment': instance.userComment,
    };
