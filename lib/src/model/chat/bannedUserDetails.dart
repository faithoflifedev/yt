import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'bannedUserDetails.g.dart';

@JsonSerializable()
class BannedUserDetails {
  final String? channelId;
  final String? channelUrl;
  final String? displayName;
  final String? profileImageUrl;
  final String? banType;
  final int? banDurationSeconds;

  BannedUserDetails(
      {this.channelId,
      this.channelUrl,
      this.displayName,
      this.profileImageUrl,
      this.banType,
      this.banDurationSeconds});

  factory BannedUserDetails.fromJson(Map<String, dynamic> json) =>
      _$BannedUserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BannedUserDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
