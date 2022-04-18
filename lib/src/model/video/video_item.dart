import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';
import 'content_details.dart';
import 'status.dart';
import 'statistics.dart';
import 'player.dart';
import 'live_streaming_details.dart';

part 'video_item.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoItem {
  final String kind;
  final String etag;
  final String id;
  final Snippet? snippet;
  final ContentDetails? contentDetails;
  final Status? status;
  final Statistics? statistics;
  final Player? player;
  // final TopicDetails topicDetails;
  // final RecordingDetails? recordingDetails;
  // final FileDetails? fileDetails;
  // final ProcessingDetails? processingDetails;
  // final Suggestions? suggestions;
  final LiveStreamingDetails? liveStreamingDetails;
  // final Localizations? localizations;

  VideoItem(
      {required this.kind,
      required this.etag,
      required this.id,
      this.snippet,
      this.status,
      this.contentDetails,
      this.statistics,
      this.player,
      this.liveStreamingDetails});

  factory VideoItem.fromJson(Map<String, dynamic> json) =>
      _$VideoItemFromJson(json);

  Map<String, dynamic> toJson() => _$VideoItemToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
