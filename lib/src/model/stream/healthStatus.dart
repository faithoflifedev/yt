import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'configurationIssue.dart';

part 'healthStatus.g.dart';

@JsonSerializable(explicitToJson: true)
class HealthStatus {
  final String status;
  final int? lastUpdateTimeSeconds;
  final List<ConfigurationIssue>? configurationIssues;

  HealthStatus(
      {required this.status,
      this.lastUpdateTimeSeconds,
      required this.configurationIssues});

  factory HealthStatus.fromJson(Map<String, dynamic> json) =>
      _$HealthStatusFromJson(json);

  Map<String, dynamic> toJson() => _$HealthStatusToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
