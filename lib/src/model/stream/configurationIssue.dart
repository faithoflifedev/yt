import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'configurationIssue.g.dart';

@JsonSerializable()
class ConfigurationIssue {
  final String? type;
  final String? severity;
  final String? reason;
  final String? description;

  ConfigurationIssue({this.type, this.severity, this.reason, this.description});

  factory ConfigurationIssue.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationIssueFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationIssueToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
