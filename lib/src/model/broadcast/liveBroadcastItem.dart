import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';
import 'status.dart';
import 'contentDetails.dart';
import 'statistics.dart';

part 'liveBroadcastItem.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveBroadcastItem extends Comparable {
  final String kind;
  final String etag;
  final String id;
  final Snippet? snippet;
  final Status? status;
  final ContentDetails? contentDetails;
  final Statistics? statistics;

  LiveBroadcastItem(
      {required this.kind,
      required this.etag,
      required this.id,
      this.snippet,
      this.status,
      this.contentDetails,
      this.statistics});

  factory LiveBroadcastItem.fromJson(Map<String, dynamic> json) =>
      _$LiveBroadcastItemFromJson(json);

  Map<String, dynamic> toJson() => _$LiveBroadcastItemToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  @override
  int compareTo(other) =>
      defaultStartTime(DateTime.fromMillisecondsSinceEpoch(0).toUtc())
          .compareTo(other.defaultStartTime(
              DateTime.fromMillisecondsSinceEpoch(0).toUtc()));

  DateTime defaultStartTime([DateTime? otherwise]) =>
      snippet != null && snippet!.scheduledStartTime != null
          ? snippet!.scheduledStartTime!
          : otherwise ?? DateTime.fromMillisecondsSinceEpoch(0).toUtc();
}
