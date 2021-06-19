import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'thumbnail.dart';

part 'thumbnails.g.dart';

@JsonSerializable(explicitToJson: true)
class Thumbnails {
  @JsonKey(name: 'default')
  final Thumbnail thumbnailsDefault;
  final Thumbnail? medium;
  final Thumbnail? high;
  final Thumbnail? standard;
  final Thumbnail? maxres;

  Thumbnails({
    required this.thumbnailsDefault,
    this.medium,
    this.high,
    required this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
