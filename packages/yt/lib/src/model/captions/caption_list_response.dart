import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../response_metadata.dart';
import 'caption_item.dart';

part 'caption_list_response.g.dart';

/// The response to a captions.list API request. Identified by youtube#captionListResponse.
@JsonSerializable(explicitToJson: true)
class CaptionListResponse extends ResponseMetadata {
  /// A list of captions that match the request criteria.
  @JsonKey(name: 'items')
  final List<CaptionItem>? captionItems;

  CaptionListResponse({
    required super.kind,
    required super.etag,
    this.captionItems,
  });

  List<CaptionItem> get items => captionItems ?? [];

  factory CaptionListResponse.fromJson(Map<String, dynamic> json) =>
      _$CaptionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
