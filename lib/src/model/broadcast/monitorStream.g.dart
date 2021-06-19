// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitorStream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonitorStream _$MonitorStreamFromJson(Map<String, dynamic> json) {
  return MonitorStream(
    enableMonitorStream: json['enableMonitorStream'] as bool,
    broadcastStreamDelayMs: json['broadcastStreamDelayMs'] as int?,
    embedHtml: json['embedHtml'] as String?,
  );
}

Map<String, dynamic> _$MonitorStreamToJson(MonitorStream instance) =>
    <String, dynamic>{
      'enableMonitorStream': instance.enableMonitorStream,
      'broadcastStreamDelayMs': instance.broadcastStreamDelayMs,
      'embedHtml': instance.embedHtml,
    };
