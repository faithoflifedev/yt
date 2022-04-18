import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../page_info.dart';
import 'video_category.dart';

part 'video_category_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoCategoryListResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final PageInfo pageInfo;
  final List<VideoCategory> items;

  VideoCategoryListResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      required this.pageInfo,
      required this.items});

  factory VideoCategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCategoryListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
