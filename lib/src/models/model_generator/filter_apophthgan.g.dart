// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_apophthgan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApophthganFilter _$ApophthganFilterFromJson(Map<String, dynamic> json) =>
    ApophthganFilter(
      json['_id'] as String?,
      json['author'] as String?,
      json['__v'] as int?,
      json['mood'] as String?,
      json['reason'] as String?,
      json['pathImage'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ApophthganFilterToJson(ApophthganFilter instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'mood': instance.mood,
      'reason': instance.reason,
      'pathImage': instance.pathImage,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

ApophthganFilterResponse _$ApophthganFilterResponseFromJson(
        Map<String, dynamic> json) =>
    ApophthganFilterResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ApophthganFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ApophthganFilterResponseToJson(
        ApophthganFilterResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
