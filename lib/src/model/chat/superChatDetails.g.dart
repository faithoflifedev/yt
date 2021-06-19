// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'superChatDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperChatDetails _$SuperChatDetailsFromJson(Map<String, dynamic> json) {
  return SuperChatDetails(
    amountMicros: json['amountMicros'] as int?,
    currency: json['currency'] as String?,
    amountDisplayString: json['amountDisplayString'] as String?,
    userComment: json['userComment'] as String?,
    tier: json['tier'] as int?,
  );
}

Map<String, dynamic> _$SuperChatDetailsToJson(SuperChatDetails instance) =>
    <String, dynamic>{
      'amountMicros': instance.amountMicros,
      'currency': instance.currency,
      'amountDisplayString': instance.amountDisplayString,
      'userComment': instance.userComment,
      'tier': instance.tier,
    };
