import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:yt/yt.dart';

part 'annotationRequests.g.dart';

@JsonSerializable(explicitToJson: true)
class AnnotationRequests {
  final List<AnnotationRequest> requests;

  AnnotationRequests({
    required this.requests,
  });

  factory AnnotationRequests.fromJson(Map<String, dynamic> json) =>
      _$AnnotationRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationRequestsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
