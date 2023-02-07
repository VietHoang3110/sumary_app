// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataIssue _$DataIssueFromJson(Map<String, dynamic> json) => DataIssue(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      author: json['author'] as String?,
      createdAt: json['createdAt'] as String?,
      v: json['__v'] as int?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DataIssueToJson(DataIssue instance) => <String, dynamic>{
      '_id': instance.id,
      '__v': instance.v,
      'name': instance.name,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ListIssue _$ListIssueFromJson(Map<String, dynamic> json) => ListIssue(
      json['total'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pageSize'] as int?,
      json['currentPage'] as int?,
    );

Map<String, dynamic> _$ListIssueToJson(ListIssue instance) => <String, dynamic>{
      'total': instance.total,
      'records': instance.records,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
    };

ListIssueResponse _$ListIssueResponseFromJson(Map<String, dynamic> json) =>
    ListIssueResponse(
      json['data'] == null
          ? null
          : ListIssue.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListIssueResponseToJson(ListIssueResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
