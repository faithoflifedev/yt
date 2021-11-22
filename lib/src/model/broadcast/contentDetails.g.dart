// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contentDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) =>
    ContentDetails(
      boundStreamId: json['boundStreamId'] as String?,
      boundStreamLastUpdateTimeMs: json['boundStreamLastUpdateTimeMs'] == null
          ? null
          : DateTime.parse(json['boundStreamLastUpdateTimeMs'] as String),
      monitorStream:
          MonitorStream.fromJson(json['monitorStream'] as Map<String, dynamic>),
      enableEmbed: json['enableEmbed'] as bool,
      enableDvr: json['enableDvr'] as bool,
      enableContentEncryption: json['enableContentEncryption'] as bool,
      startWithSlate: json['startWithSlate'] as bool,
      recordFromStart: json['recordFromStart'] as bool,
      enableClosedCaptions: json['enableClosedCaptions'] as bool,
      closedCaptionsType: json['closedCaptionsType'] as String,
      enableLowLatency: json['enableLowLatency'] as bool,
      latencyPreference: json['latencyPreference'] as String,
      projection: json['projection'] as String,
      enableAutoStart: json['enableAutoStart'] as bool,
      enableAutoStop: json['enableAutoStop'] as bool,
    );

Map<String, dynamic> _$ContentDetailsToJson(ContentDetails instance) =>
    <String, dynamic>{
      'boundStreamId': instance.boundStreamId,
      'boundStreamLastUpdateTimeMs':
          instance.boundStreamLastUpdateTimeMs?.toIso8601String(),
      'monitorStream': instance.monitorStream.toJson(),
      'enableEmbed': instance.enableEmbed,
      'enableDvr': instance.enableDvr,
      'enableContentEncryption': instance.enableContentEncryption,
      'startWithSlate': instance.startWithSlate,
      'recordFromStart': instance.recordFromStart,
      'enableClosedCaptions': instance.enableClosedCaptions,
      'closedCaptionsType': instance.closedCaptionsType,
      'enableLowLatency': instance.enableLowLatency,
      'latencyPreference': instance.latencyPreference,
      'projection': instance.projection,
      'enableAutoStart': instance.enableAutoStart,
      'enableAutoStop': instance.enableAutoStop,
    };
