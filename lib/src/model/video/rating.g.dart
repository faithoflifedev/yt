// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// EasyEnumGenerator
// **************************************************************************

extension VideoRatingExt on VideoRating {
  String get value => ['none', 'dislike', 'like'][index];
}

extension VideoRatingTxe on String {
  VideoRating? get videoRating => {
        'none': VideoRating.none,
        'dislike': VideoRating.dislike,
        'like': VideoRating.like,
      }[this];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(
    videoId: json['videoId'] as String,
    rating: json['rating'] as String,
  )..enumRating =
      _$enumDecodeNullable(_$VideoRatingEnumMap, json['enumRating']);
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'videoId': instance.videoId,
      'rating': instance.rating,
      'enumRating': _$VideoRatingEnumMap[instance.enumRating],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$VideoRatingEnumMap = {
  VideoRating.none: 'none',
  VideoRating.dislike: 'dislike',
  VideoRating.like: 'like',
};
