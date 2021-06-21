import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'channelItem.dart';

part 'channelResponse.g.dart';

//////A channel resource contains information about a YouTube channel.
@JsonSerializable(explicitToJson: true)
class ChannelResponse {
  ///Identifies the API resource's type. The value will be youtube#channelListResponse.
  final String kind;

  ///The Etag of this resource.
  final String etag;

  ///The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
  final String? nextPageToken;

  ///The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set. Note that this property is not included in the API response if the corresponding API request set the managedByMe parameter to true.
  final String? prevPageToken;

  ///The pageInfo object encapsulates paging information for the result set.
  final PageInfo pageInfo;

  ///A list of channels that match the request criteria.
  final List<ChannelItem> items;

  ChannelResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      required this.pageInfo,
      required this.items});

  factory ChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
