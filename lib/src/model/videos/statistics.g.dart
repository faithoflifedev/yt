// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistics _$StatisticsFromJson(Map<String, dynamic> json) => Statistics(
      viewCount: json['viewCount'] as int?,
      likeCount: json['likeCount'] as int?,
      dislikeCount: json['dislikeCount'] as int?,
      favoriteCount: json['favoriteCount'] as int?,
      commentCount: json['commentCount'] as int?,
    );

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'favoriteCount': instance.favoriteCount,
      'commentCount': instance.commentCount,
    };
