// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caption_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaptionListResponse _$CaptionListResponseFromJson(Map<String, dynamic> json) =>
    CaptionListResponse(
      kind: json['kind'] as String,
      etag: json['etag'] as String,
      captionItems: (json['items'] as List<dynamic>?)
          ?.map((e) => CaptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CaptionListResponseToJson(
  CaptionListResponse instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'etag': instance.etag,
  'items': instance.captionItems?.map((e) => e.toJson()).toList(),
};
