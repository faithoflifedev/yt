// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return Statistics(
    viewCount: json['viewCount'] as int,
    subscriberCount: json['subscriberCount'] as int,
    hiddenSubscriberCount: json['hiddenSubscriberCount'] as bool,
    videoCount: json['videoCount'] as int,
  );
}

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'viewCount': instance.viewCount,
      'subscriberCount': instance.subscriberCount,
      'hiddenSubscriberCount': instance.hiddenSubscriberCount,
      'videoCount': instance.videoCount,
    };