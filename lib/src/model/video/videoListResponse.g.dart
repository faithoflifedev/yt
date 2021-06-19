// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoListResponse _$VideoListResponseFromJson(Map<String, dynamic> json) {
  return VideoListResponse(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    nextPageToken: json['nextPageToken'] as String?,
    prevPageToken: json['prevPageToken'] as String?,
    pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>)
        .map((e) => VideoItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VideoListResponseToJson(VideoListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'pageInfo': instance.pageInfo.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
