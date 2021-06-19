import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'fanFundingEventDetails.dart';
import 'textMessageDetails.dart';
import 'messageDeletedDetails.dart';
import 'userBannedDetails.dart';
import 'superChatDetails.dart';
import 'superStickerDetails.dart';

part 'snippet.g.dart';

@JsonSerializable(explicitToJson: true)
class Snippet {
  final String? type;
  final String? liveChatId;
  final String? authorChannelId;
  final DateTime? publishedAt;
  final bool? hasDisplayContent;
  final String? displayMessage;
  final FanFundingEventDetails? fanFundingEventDetails;
  final TextMessageDetails? textMessageDetails;
  final MessageDeletedDetails? messageDeletedDetails;
  final UserBannedDetails? userBannedDetails;
  final SuperChatDetails? superChatDetails;
  final SuperStickerDetails? superStickerDetails;

  Snippet(
      {this.type,
      this.liveChatId,
      this.authorChannelId,
      this.publishedAt,
      this.hasDisplayContent,
      this.displayMessage,
      this.fanFundingEventDetails,
      this.textMessageDetails,
      this.messageDeletedDetails,
      this.userBannedDetails,
      this.superChatDetails,
      this.superStickerDetails});

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
