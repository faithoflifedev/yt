import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../page_info.dart';
import 'playlist_item.dart';

part 'playlist_item_list_response.g.dart';

///A collection of playlist items that match the API request parameters. You can retrieve all of the playlist items in a specified playlist or retrieve one or more playlist items by their unique IDs. Try it now.
@JsonSerializable(explicitToJson: true)
class PlaylistItemListResponse {
  ///Identifies the API resource's type. The value will be youtube#playlistItemListResponse.
  final String kind;

  ///The Etag of this resource.
  final String etag;

  ///The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
  final String? nextPageToken;

  ///The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
  final String? prevPageToken;

  ///The pageInfo object encapsulates paging information for the result set.
  final PageInfo pageInfo;

  ///A list of playlist items that match the request criteria.
  final List<PlaylistItem> items;

  PlaylistItemListResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      required this.pageInfo,
      required this.items});

  factory PlaylistItemListResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistItemListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
