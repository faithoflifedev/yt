import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../thumbnail.dart';

part 'thumbnailSetResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ThumbnailSetResponse {
  final String kind;
  final String etag;
  final List<Map<String, Thumbnail>> items;

  ThumbnailSetResponse(
      {required this.kind, required this.etag, required this.items});

  factory ThumbnailSetResponse.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailSetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailSetResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
