// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landmark _$LandmarkFromJson(Map<String, dynamic> json) {
  return Landmark(
    type: json['type'] as String,
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LandmarkToJson(Landmark instance) => <String, dynamic>{
      'type': instance.type,
      'position': instance.position.toJson(),
    };
