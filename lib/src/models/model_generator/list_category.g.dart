// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataChildCategory _$DataChildCategoryFromJson(Map<String, dynamic> json) =>
    DataChildCategory(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['parent'] as String?,
      json['enabled'] as bool?,
      json['author'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataChildCategoryToJson(DataChildCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parent': instance.parent,
      'enabled': instance.enabled,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

DataCategory _$DataCategoryFromJson(Map<String, dynamic> json) => DataCategory(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['parent'] as String?,
      json['enabled'] as bool?,
      json['author'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['lastEditor'] as String?,
      json['order'] as int?,
      json['row'] as int,
      json['__v'] as int?,
      (json['childs'] as List<dynamic>?)
          ?.map((e) => DataChildCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataCategoryToJson(DataCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parent': instance.parent,
      'enabled': instance.enabled,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'lastEditor': instance.lastEditor,
      'order': instance.order,
      'row': instance.row,
      '__v': instance.v,
      'childs': instance.childs,
    };

ListCategory _$ListCategoryFromJson(Map<String, dynamic> json) => ListCategory(
      json['total'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => DataCategory.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      json['currentPage'] as int?,
      json['pageSize'] as int?,
    );

Map<String, dynamic> _$ListCategoryToJson(ListCategory instance) =>
    <String, dynamic>{
      'total': instance.total,
      'records': instance.records,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
    };

ListCategoryResponse _$ListCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    ListCategoryResponse(
      json['data'] == null
          ? null
          : ListCategory.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListCategoryResponseToJson(
        ListCategoryResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
