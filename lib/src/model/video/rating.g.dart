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

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      videoId: json['videoId'] as String,
      rating: json['rating'] as String,
    )..enumRating =
        $enumDecodeNullable(_$VideoRatingEnumMap, json['enumRating']);

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'videoId': instance.videoId,
      'rating': instance.rating,
      'enumRating': _$VideoRatingEnumMap[instance.enumRating],
    };

const _$VideoRatingEnumMap = {
  VideoRating.none: 'none',
  VideoRating.dislike: 'dislike',
  VideoRating.like: 'like',
};
