// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userBannedDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBannedDetails _$UserBannedDetailsFromJson(Map<String, dynamic> json) {
  return UserBannedDetails(
    bannedUserDetails: json['bannedUserDetails'] == null
        ? null
        : BannedUserDetails.fromJson(
            json['bannedUserDetails'] as Map<String, dynamic>),
    channelUrl: json['channelUrl'] as String?,
    displayName: json['displayName'] as String?,
    profileImageUrl: json['profileImageUrl'] as String?,
    isVerified: json['isVerified'] as bool?,
    isChatOwner: json['isChatOwner'] as bool?,
    isChatSponsor: json['isChatSponsor'] as bool?,
    isChatModerator: json['isChatModerator'] as bool?,
  );
}

Map<String, dynamic> _$UserBannedDetailsToJson(UserBannedDetails instance) =>
    <String, dynamic>{
      'bannedUserDetails': instance.bannedUserDetails?.toJson(),
      'channelUrl': instance.channelUrl,
      'displayName': instance.displayName,
      'profileImageUrl': instance.profileImageUrl,
      'isVerified': instance.isVerified,
      'isChatOwner': instance.isChatOwner,
      'isChatSponsor': instance.isChatSponsor,
      'isChatModerator': instance.isChatModerator,
    };
