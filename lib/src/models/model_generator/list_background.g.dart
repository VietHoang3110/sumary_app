// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_background.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBackground _$DataBackgroundFromJson(Map<String, dynamic> json) =>
    DataBackground(
      json['_id'] as String?,
      json['name'] as String?,
      json['imageUrl'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataBackgroundToJson(DataBackground instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

ListBackgroundResponse _$ListBackgroundResponseFromJson(
        Map<String, dynamic> json) =>
    ListBackgroundResponse(
      (json['data'] as List<dynamic>)
          .map((e) => DataBackground.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListBackgroundResponseToJson(
        ListBackgroundResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
