import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';
import 'contentDetails.dart';
import 'statistics.dart';

part 'channelItem.g.dart';

///A channel resource contains information about a YouTube channel.
@JsonSerializable(explicitToJson: true)
class ChannelItem {
  ///Identifies the API resource's type. The value will be youtube#channel.
  final String kind;

  ///The Etag of this resource.
  final String etag;

  ///The ID that YouTube uses to uniquely identify the channel
  final String id;

  ///The [Snippet] object contains basic details about the channel, such as its title, description, and thumbnail images.
  final Snippet? snippet;

  ///The [ContentDetails] object encapsulates information about the channel's content.
  final ContentDetails? contentDetails;

  ///The [Statistics] object encapsulates statistics for the channel.
  final Statistics? statistics;

  ChannelItem(
      {required this.kind,
      required this.etag,
      required this.id,
      this.snippet,
      this.contentDetails,
      this.statistics});

  factory ChannelItem.fromJson(Map<String, dynamic> json) =>
      _$ChannelItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelItemToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
