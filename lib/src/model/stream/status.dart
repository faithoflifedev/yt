import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'healthStatus.dart';

part 'status.g.dart';

@JsonSerializable(explicitToJson: true)
class Status {
  final String streamStatus;
  final HealthStatus healthStatus;

  Status({required this.streamStatus, required this.healthStatus});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
