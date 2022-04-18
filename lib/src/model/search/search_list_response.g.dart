// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchListResponse _$SearchListResponseFromJson(Map<String, dynamic> json) =>
    SearchListResponse(
      kind: json['kind'] as String,
      etag: json['etag'] as String,
      nextPageToken: json['nextPageToken'] as String?,
      prevPageToken: json['prevPageToken'] as String?,
      regionCode: json['regionCode'] as String?,
      pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchListResponseToJson(SearchListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'regionCode': instance.regionCode,
      'pageInfo': instance.pageInfo.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
