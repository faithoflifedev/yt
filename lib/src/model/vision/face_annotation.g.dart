// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_annotation.dart';

// **************************************************************************
// EasyEnumGenerator
// **************************************************************************

extension LikelihoodExt on Likelihood {
  String get value => [
        'UNKNOWN',
        'VERY_UNLIKELY',
        'UNLIKELY',
        'POSSIBLE',
        'LIKELY',
        'VERY_LIKELY'
      ][index];
}

extension LikelihoodTxe on String {
  Likelihood? get likelihood => {
        'UNKNOWN': Likelihood.UNKNOWN,
        'VERY_UNLIKELY': Likelihood.VERY_UNLIKELY,
        'UNLIKELY': Likelihood.UNLIKELY,
        'POSSIBLE': Likelihood.POSSIBLE,
        'LIKELY': Likelihood.LIKELY,
        'VERY_LIKELY': Likelihood.VERY_LIKELY,
      }[this];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceAnnotation _$FaceAnnotationFromJson(Map<String, dynamic> json) =>
    FaceAnnotation(
      boundingPoly:
          BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
      fdBoundingPoly:
          BoundingPoly.fromJson(json['fdBoundingPoly'] as Map<String, dynamic>),
      landmarks: (json['landmarks'] as List<dynamic>)
          .map((e) => Landmark.fromJson(e as Map<String, dynamic>))
          .toList(),
      rollAngle: (json['rollAngle'] as num).toDouble(),
      panAngle: (json['panAngle'] as num).toDouble(),
      tiltAngle: (json['tiltAngle'] as num).toDouble(),
      detectionConfidence: (json['detectionConfidence'] as num).toDouble(),
      landmarkingConfidence: (json['landmarkingConfidence'] as num).toDouble(),
      enumJoyLikelihood: json['joyLikelihood'] as String,
      enumSorrowLikelihood: json['sorrowLikelihood'] as String,
      enumAngerLikelihood: json['angerLikelihood'] as String,
      enumSurpriseLikelihood: json['surpriseLikelihood'] as String,
      enumUnderExposedLikelihood: json['underExposedLikelihood'] as String,
      enumBlurredLikelihood: json['blurredLikelihood'] as String,
      enumHeadwearLikelihood: json['headwearLikelihood'] as String,
    );

Map<String, dynamic> _$FaceAnnotationToJson(FaceAnnotation instance) =>
    <String, dynamic>{
      'boundingPoly': instance.boundingPoly.toJson(),
      'fdBoundingPoly': instance.fdBoundingPoly.toJson(),
      'landmarks': instance.landmarks.map((e) => e.toJson()).toList(),
      'rollAngle': instance.rollAngle,
      'panAngle': instance.panAngle,
      'tiltAngle': instance.tiltAngle,
      'detectionConfidence': instance.detectionConfidence,
      'landmarkingConfidence': instance.landmarkingConfidence,
      'joyLikelihood': instance.enumJoyLikelihood,
      'sorrowLikelihood': instance.enumSorrowLikelihood,
      'angerLikelihood': instance.enumAngerLikelihood,
      'surpriseLikelihood': instance.enumSurpriseLikelihood,
      'underExposedLikelihood': instance.enumUnderExposedLikelihood,
      'blurredLikelihood': instance.enumBlurredLikelihood,
      'headwearLikelihood': instance.enumHeadwearLikelihood,
    };
