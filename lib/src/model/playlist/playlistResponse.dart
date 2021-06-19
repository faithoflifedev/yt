import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'playlist.dart';

part 'playlistResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaylistResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final String? regionCode;
  final PageInfo pageInfo;
  final List<Playlist> items;

  PlaylistResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      this.regionCode,
      required this.pageInfo,
      required this.items});

  factory PlaylistResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaylistResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
