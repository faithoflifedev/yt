import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bannedUserDetails.dart';

part 'userBannedDetails.g.dart';

@JsonSerializable(explicitToJson: true)
class UserBannedDetails {
  final BannedUserDetails? bannedUserDetails;
  final String? channelUrl;
  final String? displayName;
  final String? profileImageUrl;
  final bool? isVerified;
  final bool? isChatOwner;
  final bool? isChatSponsor;
  final bool? isChatModerator;

  UserBannedDetails(
      {this.bannedUserDetails,
      this.channelUrl,
      this.displayName,
      this.profileImageUrl,
      this.isVerified,
      this.isChatOwner,
      this.isChatSponsor,
      this.isChatModerator});

  factory UserBannedDetails.fromJson(Map<String, dynamic> json) =>
      _$UserBannedDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserBannedDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
