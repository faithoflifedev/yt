import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'videoItem.dart';

part 'videoListResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoListResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final PageInfo pageInfo;
  final List<VideoItem> items;

  VideoListResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      required this.pageInfo,
      required this.items});

  factory VideoListResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
