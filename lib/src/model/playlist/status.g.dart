// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    privacyStatus: json['privacyStatus'] as String,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'privacyStatus': instance.privacyStatus,
    };
