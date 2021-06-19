// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoGetRatingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoGetRatingResponse _$VideoGetRatingResponseFromJson(
    Map<String, dynamic> json) {
  return VideoGetRatingResponse(
    json['kind'] as String,
    json['etag'] as String,
    (json['items'] as List<dynamic>)
        .map((e) => Rating.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VideoGetRatingResponseToJson(
        VideoGetRatingResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
