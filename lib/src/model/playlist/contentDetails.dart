import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'contentDetails.g.dart';

@JsonSerializable()
class ContentDetails {
  final int itemCount;

  ContentDetails({required this.itemCount});

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
