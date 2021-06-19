import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'superStickerMetadata.g.dart';

@JsonSerializable()
class SuperStickerMetadata {
  final String? stickerId;
  final String? altText;
  final String? language;

  SuperStickerMetadata({this.stickerId, this.altText, this.language});

  factory SuperStickerMetadata.fromJson(Map<String, dynamic> json) =>
      _$SuperStickerMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$SuperStickerMetadataToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
