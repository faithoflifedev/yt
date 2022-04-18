import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'normalized_vertex.dart';
import 'vertex.dart';

part 'bounding_poly.g.dart';

@JsonSerializable(explicitToJson: true)
class BoundingPoly {
  @JsonKey(defaultValue: [])
  final List<NormalizedVertex> normalizedVertices;

  @JsonKey(defaultValue: [])
  final List<Vertex> vertices;

  bool get isNormalized => normalizedVertices.isEmpty;

  BoundingPoly({required this.normalizedVertices, required this.vertices});

  factory BoundingPoly.fromJson(Map<String, dynamic> json) =>
      _$BoundingPolyFromJson(json);

  Map<String, dynamic> toJson() => _$BoundingPolyToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
