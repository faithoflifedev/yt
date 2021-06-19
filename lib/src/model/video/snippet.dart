import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../thumbnails.dart';

part 'snippet.g.dart';

@JsonSerializable(explicitToJson: true)
class Snippet {
  final DateTime? publishedAt;
  final String? channelId;
  final String title;
  final String? description;
  final Thumbnails? thumbnails;
  final DateTime? scheduledStartTime;
  final bool? isDefaultBroadcast;
  final String? liveChatId;
  final bool? isDefaultStream;

  Snippet(
      {this.publishedAt,
      this.channelId,
      required this.title,
      this.description,
      this.thumbnails,
      this.scheduledStartTime,
      this.isDefaultBroadcast,
      this.liveChatId,
      this.isDefaultStream});

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
