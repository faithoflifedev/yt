import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';
import 'authorDetails.dart';

part 'liveChatMessage.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveChatMessage {
  final String kind;
  final String etag;
  final String id;
  final Snippet snippet;
  final AuthorDetails? authorDetails;

  LiveChatMessage(
      {required this.kind,
      required this.etag,
      required this.id,
      required this.snippet,
      this.authorDetails});

  factory LiveChatMessage.fromJson(Map<String, dynamic> json) =>
      _$LiveChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LiveChatMessageToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
