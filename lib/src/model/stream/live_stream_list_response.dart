import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../page_info.dart';
import 'live_stream_item.dart';

part 'live_stream_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveStreamListResponse {
  final String kind;
  final String etag;
  final PageInfo pageInfo;
  final List<LiveStreamItem> items;
  final String? id;

  LiveStreamListResponse(
      this.kind, this.etag, this.pageInfo, this.items, this.id);

  factory LiveStreamListResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LiveStreamListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
