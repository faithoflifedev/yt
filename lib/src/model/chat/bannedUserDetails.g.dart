// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bannedUserDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannedUserDetails _$BannedUserDetailsFromJson(Map<String, dynamic> json) {
  return BannedUserDetails(
    channelId: json['channelId'] as String?,
    channelUrl: json['channelUrl'] as String?,
    displayName: json['displayName'] as String?,
    profileImageUrl: json['profileImageUrl'] as String?,
    banType: json['banType'] as String?,
    banDurationSeconds: json['banDurationSeconds'] as int?,
  );
}

Map<String, dynamic> _$BannedUserDetailsToJson(BannedUserDetails instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelUrl': instance.channelUrl,
      'displayName': instance.displayName,
      'profileImageUrl': instance.profileImageUrl,
      'banType': instance.banType,
      'banDurationSeconds': instance.banDurationSeconds,
    };
