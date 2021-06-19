import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'position.g.dart';

@JsonSerializable()
class Position {
  final double x;
  final double y;
  final double z;

  Position({required this.x, required this.y, required this.z});

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
