// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelResponse _$ChannelResponseFromJson(Map<String, dynamic> json) {
  return ChannelResponse(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    nextPageToken: json['nextPageToken'] as String?,
    prevPageToken: json['prevPageToken'] as String?,
    regionCode: json['regionCode'] as String?,
    pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>)
        .map((e) => ChannelItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ChannelResponseToJson(ChannelResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'regionCode': instance.regionCode,
      'pageInfo': instance.pageInfo.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
