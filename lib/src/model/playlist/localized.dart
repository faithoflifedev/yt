import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'localized.g.dart';

@JsonSerializable()
class Localized {
  final String title;
  final String description;

  Localized({required this.title, required this.description});

  factory Localized.fromJson(Map<String, dynamic> json) =>
      _$LocalizedFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizedToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
