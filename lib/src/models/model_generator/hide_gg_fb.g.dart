// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hide_gg_fb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HideGGFB _$HideGGFBFromJson(Map<String, dynamic> json) => HideGGFB(
      json['_id'] as String?,
      json['value'] as int?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$HideGGFBToJson(HideGGFB instance) => <String, dynamic>{
      '_id': instance.id,
      'value': instance.value,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

HideGGFBResponse _$HideGGFBResponseFromJson(Map<String, dynamic> json) =>
    HideGGFBResponse(
      HideGGFB.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HideGGFBResponseToJson(HideGGFBResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
