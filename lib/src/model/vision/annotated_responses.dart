import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'annotated_response.dart';

part 'annotated_responses.g.dart';

@JsonSerializable(explicitToJson: true)
class AnnotatedResponses {
  final List<AnnotatedResponse> responses;

  AnnotatedResponses({
    required this.responses,
  });

  factory AnnotatedResponses.fromJson(Map<String, dynamic> json) =>
      _$AnnotatedResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotatedResponsesToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
