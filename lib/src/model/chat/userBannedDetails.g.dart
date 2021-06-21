// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userBannedDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBannedDetails _$UserBannedDetailsFromJson(Map<String, dynamic> json) {
  return UserBannedDetails(
    bannedUserDetails: BannedUserDetails.fromJson(
        json['bannedUserDetails'] as Map<String, dynamic>),
    banType: json['banType'] as String?,
    banDurationSeconds: json['banDurationSeconds'] as int?,
  );
}

Map<String, dynamic> _$UserBannedDetailsToJson(UserBannedDetails instance) =>
    <String, dynamic>{
      'bannedUserDetails': instance.bannedUserDetails.toJson(),
      'banType': instance.banType,
      'banDurationSeconds': instance.banDurationSeconds,
    };
