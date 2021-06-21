import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

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

  ChannelItem({required this.kind, required this.etag, required this.id});

  factory ChannelItem.fromJson(Map<String, dynamic> json) =>
      _$ChannelItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelItemToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
