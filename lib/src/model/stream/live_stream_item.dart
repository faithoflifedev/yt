import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';
import 'status.dart';
import 'cdn.dart';

part 'live_stream_item.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveStreamItem {
  final String kind;
  final String etag;
  final String id;
  final Snippet? snippet;
  final Status? status;
  final Cdn? cdn;

  LiveStreamItem(
      {required this.kind,
      required this.etag,
      required this.id,
      this.snippet,
      this.status,
      this.cdn});

  factory LiveStreamItem.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamItemFromJson(json);

  Map<String, dynamic> toJson() => _$LiveStreamItemToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
