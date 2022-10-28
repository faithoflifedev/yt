import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../thumbnail.dart';

part 'thumbnails_set_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ThumbnailsSetResponse {
  final String kind;
  final String etag;
  final List<Map<String, Thumbnail>> items;

  ThumbnailsSetResponse(
      {required this.kind, required this.etag, required this.items});

  factory ThumbnailsSetResponse.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsSetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsSetResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
