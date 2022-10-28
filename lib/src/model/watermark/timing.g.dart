// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timing _$TimingFromJson(Map<String, dynamic> json) => Timing(
      type: json['type'] as String,
      offsetMs: json['offsetMs'] as int,
      durationMs: json['durationMs'] as int,
    );

Map<String, dynamic> _$TimingToJson(Timing instance) => <String, dynamic>{
      'type': instance.type,
      'offsetMs': instance.offsetMs,
      'durationMs': instance.durationMs,
    };
