import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'channelItem.g.dart';

@JsonSerializable(explicitToJson: true)
class ChannelItem {
  final String kind;
  final String etag;
  final String id;

  ChannelItem({required this.kind, required this.etag, required this.id});

  factory ChannelItem.fromJson(Map<String, dynamic> json) =>
      _$ChannelItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelItemToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
