import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'liveBroadcastItem.dart';

part 'liveBroadcastResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveBroadcastResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final PageInfo pageInfo;
  final List<LiveBroadcastItem> items;

  LiveBroadcastResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
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
