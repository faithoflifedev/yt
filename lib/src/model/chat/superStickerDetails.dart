import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'superStickerMetadata.dart';

part 'superStickerDetails.g.dart';

@JsonSerializable(explicitToJson: true)
class SuperStickerDetails {
  final SuperStickerMetadata? superStickerMetadata;
  final int? amountMicros;
  final String? currency;
  final String? amountDisplayString;
  final int? tier;

  SuperStickerDetails(
      {this.superStickerMetadata,
      this.amountMicros,
      this.currency,
      this.amountDisplayString,
      this.tier});

  factory SuperStickerDetails.fromJson(Map<String, dynamic> json) =>
      _$SuperStickerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SuperStickerDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
