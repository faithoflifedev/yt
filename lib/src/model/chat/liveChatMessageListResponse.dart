import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'liveChatMessage.dart';

part 'liveChatMessageListResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveChatMessageListResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final int? pollingIntervalMillis;
  final DateTime? offlineAt;
  final PageInfo pageInfo;
  final List<LiveChatMessage> items;

  LiveChatMessageListResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.pollingIntervalMillis,
      this.offlineAt,
      required this.pageInfo,
      required this.items});

  factory LiveChatMessageListResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveChatMessageListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LiveChatMessageListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
