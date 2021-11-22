// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liveStreamListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveStreamListResponse _$LiveStreamListResponseFromJson(
        Map<String, dynamic> json) =>
    LiveStreamListResponse(
      json['kind'] as String,
      json['etag'] as String,
      PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      (json['items'] as List<dynamic>)
          .map((e) => LiveStreamItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as String,
    );

Map<String, dynamic> _$LiveStreamListResponseToJson(
        LiveStreamListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'pageInfo': instance.pageInfo.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
