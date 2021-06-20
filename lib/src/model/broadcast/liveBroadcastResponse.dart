import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'liveBroadcastItem.dart';

part 'liveBroadcastResponse.g.dart';

///LiveBroadcastResponse
@JsonSerializable(explicitToJson: true)
class LiveBroadcastResponse {
  ///Identifies the API resource's type. The value will be youtube#liveBroadcastListResponse.
  final String kind;

  ///The Etag of this resource.
  final String etag;

  ///The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
  final String? nextPageToken;

  ///The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
  final String? prevPageToken;

  ///The pageInfo object encapsulates paging information for the result set.
  final PageInfo pageInfo;

  ///A list of broadcasts that match the request criteria.
  final List<LiveBroadcastItem> items;

  LiveBroadcastResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      required this.pageInfo,
      required this.items});

  factory LiveBroadcastResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveBroadcastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LiveBroadcastResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  static LiveBroadcastItem closestTo(List<LiveBroadcastItem> items,
      {DateTime? dateTime}) {
    final check = dateTime ?? DateTime.now().toUtc();

    return items.reduce((a, b) {
      print(
          'a: ${a.defaultStartTime().difference(check).abs().inSeconds}, b: ${b.defaultStartTime().difference(check).abs().inSeconds}');

      return a.defaultStartTime().difference(check).abs() <
              b.defaultStartTime().difference(check).abs()
          ? a
          : b;
    });
  }
}
