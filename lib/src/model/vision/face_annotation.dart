// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:easy_enum/easy_enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yt/src/model/vision/bounding_poly.dart';

import 'landmark.dart';
import 'bounding_poly.dart';

part 'face_annotation.g.dart';

@JsonSerializable(explicitToJson: true)
class FaceAnnotation {
  final BoundingPoly boundingPoly;
  final BoundingPoly fdBoundingPoly;
  final List<Landmark> landmarks;
  final double rollAngle;
  final double panAngle;
  final double tiltAngle;
  final double detectionConfidence;
  final double landmarkingConfidence;

  @JsonKey(name: 'joyLikelihood')
  final String enumJoyLikelihood;

  @JsonKey(name: 'sorrowLikelihood')
  final String enumSorrowLikelihood;

  @JsonKey(name: 'angerLikelihood')
  final String enumAngerLikelihood;

  @JsonKey(name: 'surpriseLikelihood')
  final String enumSurpriseLikelihood;

  @JsonKey(name: 'underExposedLikelihood')
  final String enumUnderExposedLikelihood;

  @JsonKey(name: 'blurredLikelihood')
  final String enumBlurredLikelihood;

  @JsonKey(name: 'headwearLikelihood')
  final String enumHeadwearLikelihood;

  FaceAnnotation(
      {required this.boundingPoly,
      required this.fdBoundingPoly,
      required this.landmarks,
      required this.rollAngle,
      required this.panAngle,
      required this.tiltAngle,
      required this.detectionConfidence,
      required this.landmarkingConfidence,
      required this.enumJoyLikelihood,
      required this.enumSorrowLikelihood,
      required this.enumAngerLikelihood,
      required this.enumSurpriseLikelihood,
      required this.enumUnderExposedLikelihood,
      required this.enumBlurredLikelihood,
      required this.enumHeadwearLikelihood});

  Likelihood get joyLikelihood => enumJoyLikelihood.likelihood!;
  Likelihood get sorrowLikelihood => enumSorrowLikelihood.likelihood!;
  Likelihood get angerLikelihood => enumAngerLikelihood.likelihood!;
  Likelihood get surpriseLikelihood => enumSurpriseLikelihood.likelihood!;
  Likelihood get underExposedLikelihood =>
      enumUnderExposedLikelihood.likelihood!;
  Likelihood get blurredLikelihood => enumBlurredLikelihood.likelihood!;
  Likelihood get headwearLikelihood => enumHeadwearLikelihood.likelihood!;

  factory FaceAnnotation.fromJson(Map<String, dynamic> json) =>
      _$FaceAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$FaceAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

@EasyEnum()
enum Likelihood {
  UNKNOWN,
  VERY_UNLIKELY,
  UNLIKELY,
  POSSIBLE,
  LIKELY,
  VERY_LIKELY
}
