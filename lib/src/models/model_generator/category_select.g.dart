// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_select.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryFilter _$CategoryFilterFromJson(Map<String, dynamic> json) =>
    CategoryFilter(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$CategoryFilterToJson(CategoryFilter instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

CategoryFilterResponse _$CategoryFilterResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryFilterResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CategoryFilterResponseToJson(
        CategoryFilterResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
