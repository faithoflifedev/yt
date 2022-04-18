import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'face_annotation.dart';
import 'localized_object_annotation.dart';

part 'annotated_response.g.dart';

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
