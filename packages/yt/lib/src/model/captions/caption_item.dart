import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../response_metadata.dart';
import 'caption_snippet.dart';

part 'caption_item.g.dart';

/// A caption resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.
@JsonSerializable(explicitToJson: true)
class CaptionItem extends ResponseMetadata {
  /// The ID that YouTube uses to uniquely identify the caption track.
  final String id;

  /// The snippet object contains basic details about the caption track.
  final CaptionSnippet? snippet;

  CaptionItem({
    required super.kind,
    required super.etag,
    required this.id,
    this.snippet,
  });

  factory CaptionItem.fromJson(Map<String, dynamic> json) =>
      _$CaptionItemFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionItemToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
