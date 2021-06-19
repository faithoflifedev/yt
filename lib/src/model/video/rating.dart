import 'dart:convert';

import 'package:easy_enum/easy_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  final String videoId;
  final String rating;
  VideoRating? enumRating;

  Rating({required this.videoId, required this.rating})
      : enumRating = rating.videoRating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

@EasyEnum()
enum VideoRating { none, dislike, like }
