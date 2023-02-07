// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataMoodAndReason _$DataMoodAndReasonFromJson(Map<String, dynamic> json) =>
    DataMoodAndReason(
      json['_id'] as String,
      json['iconPath'] as String,
      json['name'] as String,
      json['type'] as String?,
      json['isActivated'] as bool?,
      json['author'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataMoodAndReasonToJson(DataMoodAndReason instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'iconPath': instance.iconPath,
      'name': instance.name,
      'type': instance.type,
      'isActivated': instance.isActivated,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

DataMoodAndReasonResponse _$DataMoodAndReasonResponseFromJson(
        Map<String, dynamic> json) =>
    DataMoodAndReasonResponse(
      (json['data'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => DataMoodAndReason.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DataMoodAndReasonResponseToJson(
        DataMoodAndReasonResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
