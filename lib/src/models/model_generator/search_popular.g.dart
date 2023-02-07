// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordsDataPopular _$RecordsDataPopularFromJson(Map<String, dynamic> json) =>
    RecordsDataPopular(
      json['_id'] as String?,
      json['keyword'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['count'] as int?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$RecordsDataPopularToJson(RecordsDataPopular instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'keyword': instance.keyword,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'count': instance.count,
      '__v': instance.v,
    };

DataSearchPopular _$DataSearchPopularFromJson(Map<String, dynamic> json) =>
    DataSearchPopular(
      (json['records'] as List<dynamic>?)
          ?.map((e) => RecordsDataPopular.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
    );

Map<String, dynamic> _$DataSearchPopularToJson(DataSearchPopular instance) =>
    <String, dynamic>{
      'records': instance.records,
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
    };

SearchPopularResponse _$SearchPopularResponseFromJson(
        Map<String, dynamic> json) =>
    SearchPopularResponse(
      json['data'] == null
          ? null
          : DataSearchPopular.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SearchPopularResponseToJson(
        SearchPopularResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
