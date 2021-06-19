import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'faceAnnotation.dart';
import 'localizedObjectAnnotation.dart';

part 'annotatedResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class AnnotatedResponse {
  final List<FaceAnnotation>? faceAnnotations;
  final List<LocalizedObjectAnnotation>? localizedObjectAnnotations;

  AnnotatedResponse(
      {required this.faceAnnotations,
      required this.localizedObjectAnnotations});

  factory AnnotatedResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotatedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotatedResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
