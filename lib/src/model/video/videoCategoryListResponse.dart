import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'videoCategory.dart';

part 'videoCategoryListResponse.g.dart';

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
