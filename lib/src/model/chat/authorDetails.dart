import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'authorDetails.g.dart';

@JsonSerializable()
class AuthorDetails {
  final String? channelId;
  final String? channelUrl;
  final String? displayName;
  final String? profileImageUrl;
  final bool? isVerified;
  final bool? isChatOwner;
  final bool? isChatSponsor;
  final bool? isChatModerator;

  AuthorDetails(
      {this.channelId,
      this.channelUrl,
      this.displayName,
      this.profileImageUrl,
      this.isVerified,
      this.isChatOwner,
      this.isChatSponsor,
      this.isChatModerator});

  factory AuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
