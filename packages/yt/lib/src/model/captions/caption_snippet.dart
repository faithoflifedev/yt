import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'caption_snippet.g.dart';

/// The snippet object contains basic details about a YouTube caption track.
@JsonSerializable()
class CaptionSnippet {
  /// The ID that YouTube uses to uniquely identify the video associated with the caption track.
  final String videoId;

  /// The date and time when the caption track was last updated. The value is specified in ISO 8601 format.
  final DateTime? lastUpdated;

  /// The caption track's type. Valid values for this property are: ASR, forced, standard.
  final String? trackKind;

  /// The language of the caption track. The property value is a BCP-47 language tag.
  final String language;

  /// The name of the caption track. The name is intended to be visible to the user as an option during playback.
  final String name;

  /// The type of audio track associated with the caption track. Valid values: commentary, descriptive, primary, unknown.
  final String? audioTrackType;

  /// Indicates whether the track contains closed captions for the deaf and hard of hearing.
  final bool? isCC;

  /// Indicates whether the caption track uses large text for the vision-impaired.
  final bool? isLarge;

  /// Indicates whether caption track is formatted for "easy reader".
  final bool? isEasyReader;

  /// Indicates whether the caption track is a draft. If true, the track is not publicly visible.
  final bool? isDraft;

  /// Indicates whether YouTube synchronized the caption track to the audio track in the video.
  final bool? isAutoSynced;

  /// The caption track's status. Valid values: failed, serving, syncing.
  final String? status;

  /// The reason that YouTube failed to process the caption track. Only present when status is failed.
  final String? failureReason;

  CaptionSnippet({
    required this.videoId,
    this.lastUpdated,
    this.trackKind,
    required this.language,
    required this.name,
    this.audioTrackType,
    this.isCC,
    this.isLarge,
    this.isEasyReader,
    this.isDraft,
    this.isAutoSynced,
    this.status,
    this.failureReason,
  });

  factory CaptionSnippet.fromJson(Map<String, dynamic> json) =>
      _$CaptionSnippetFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionSnippetToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
