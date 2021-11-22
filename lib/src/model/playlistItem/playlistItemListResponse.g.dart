// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlistItemListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistItemListResponse _$PlaylistItemListResponseFromJson(
        Map<String, dynamic> json) =>
    PlaylistItemListResponse(
      kind: json['kind'] as String,
      etag: json['etag'] as String,
      nextPageToken: json['nextPageToken'] as String?,
      prevPageToken: json['prevPageToken'] as String?,
      pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => PlaylistItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaylistItemListResponseToJson(
        PlaylistItemListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'pageInfo': instance.pageInfo.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
