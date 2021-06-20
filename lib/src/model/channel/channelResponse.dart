import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'channelItem.dart';

part 'channelResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ChannelResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final String? regionCode;
  final PageInfo pageInfo;
  final List<ChannelItem> items;

  ChannelResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      this.regionCode,
      required this.pageInfo,
      required this.items});

  factory ChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
