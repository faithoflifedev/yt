// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotatedResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotatedResponse _$AnnotatedResponseFromJson(Map<String, dynamic> json) {
  return AnnotatedResponse(
    faceAnnotations: (json['faceAnnotations'] as List<dynamic>?)
        ?.map((e) => FaceAnnotation.fromJson(e as Map<String, dynamic>))
        .toList(),
    localizedObjectAnnotations:
        (json['localizedObjectAnnotations'] as List<dynamic>?)
            ?.map((e) =>
                LocalizedObjectAnnotation.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

Map<String, dynamic> _$AnnotatedResponseToJson(AnnotatedResponse instance) =>
    <String, dynamic>{
      'faceAnnotations':
          instance.faceAnnotations?.map((e) => e.toJson()).toList(),
      'localizedObjectAnnotations':
          instance.localizedObjectAnnotations?.map((e) => e.toJson()).toList(),
    };
