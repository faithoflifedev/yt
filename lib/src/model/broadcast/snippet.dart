import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../thumbnails.dart';

part 'snippet.g.dart';

@JsonSerializable(explicitToJson: true)
class Snippet {
  final DateTime? publishedAt;
  final String? channelId;
  final String title;
  final String description;
  final Thumbnails? thumbnails;
  final DateTime? scheduledStartTime;
  final DateTime? scheduledEndTime;
  final DateTime? actualStartTime;
  final bool? isDefaultBroadcast;
  final String? liveChatId;

  Snippet(
      {required this.publishedAt,
      required this.channelId,
      required this.title,
      required this.description,
      required this.thumbnails,
      this.scheduledStartTime,
      this.scheduledEndTime,
      this.actualStartTime,
      required this.isDefaultBroadcast,
      required this.liveChatId});

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
