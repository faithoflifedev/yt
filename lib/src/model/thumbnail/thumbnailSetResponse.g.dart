// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnailSetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailSetResponse _$ThumbnailSetResponseFromJson(
        Map<String, dynamic> json) =>
    ThumbnailSetResponse(
      kind: json['kind'] as String,
      etag: json['etag'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) =>
                    MapEntry(k, Thumbnail.fromJson(e as Map<String, dynamic>)),
              ))
          .toList(),
    );

Map<String, dynamic> _$ThumbnailSetResponseToJson(
        ThumbnailSetResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'items': instance.items
          .map((e) => e.map((k, e) => MapEntry(k, e.toJson())))
          .toList(),
    };
