import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'rating.dart';

part 'videoGetRatingResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoGetRatingResponse {
  final String kind;
  final String etag;
  final List<Rating> items;

  VideoGetRatingResponse(this.kind, this.etag, this.items);

  factory VideoGetRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoGetRatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoGetRatingResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
