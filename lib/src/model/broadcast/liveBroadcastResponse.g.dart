// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liveBroadcastResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveBroadcastResponse _$LiveBroadcastResponseFromJson(
    Map<String, dynamic> json) {
  return LiveBroadcastResponse(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    nextPageToken: json['nextPageToken'] as String?,
    pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>)
        .map((e) => LiveBroadcastItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LiveBroadcastResponseToJson(
        LiveBroadcastResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'pageInfo': instance.pageInfo.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
