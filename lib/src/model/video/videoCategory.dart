import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'categorySnippet.dart';

part 'videoCategory.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoCategory {
  final String kind;
  final String etag;
  final String id;
  final CategorySnippet? snippet;

  VideoCategory(
      {required this.kind, required this.etag, required this.id, this.snippet});

  factory VideoCategory.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCategoryToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
