// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'healthStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthStatus _$HealthStatusFromJson(Map<String, dynamic> json) => HealthStatus(
      status: json['status'] as String?,
      lastUpdateTimeSeconds: json['lastUpdateTimeSeconds'] as int?,
      configurationIssues: (json['configurationIssues'] as List<dynamic>)
          .map((e) => ConfigurationIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HealthStatusToJson(HealthStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'lastUpdateTimeSeconds': instance.lastUpdateTimeSeconds,
      'configurationIssues':
          instance.configurationIssues.map((e) => e.toJson()).toList(),
    };
