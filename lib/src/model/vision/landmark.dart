import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'position.dart';

part 'landmark.g.dart';

@JsonSerializable(explicitToJson: true)
class Landmark {
  final String type;
  final Position position;

  Landmark({required this.type, required this.position});

  factory Landmark.fromJson(Map<String, dynamic> json) =>
      _$LandmarkFromJson(json);

  Map<String, dynamic> toJson() => _$LandmarkToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
