// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_history_advise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueType _$IssueTypeFromJson(Map<String, dynamic> json) => IssueType(
      json['_id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$IssueTypeToJson(IssueType instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

DataHistoryAdvise _$DataHistoryAdviseFromJson(Map<String, dynamic> json) =>
    DataHistoryAdvise(
      json['_id'] as String?,
      json['name'] as String?,
      json['advisory'] as String?,
      json['issueType'] == null
          ? null
          : IssueType.fromJson(json['issueType'] as Map<String, dynamic>),
      json['appointmentDate'] as String?,
      json['phoneNumber'] as String?,
      json['email'] as String?,
      json['content'] as String?,
      json['note'] as String?,
      json['status'] as String?,
      json['bcoin'] as int?,
      json['isDeleted'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
      json['appointmentDateStr'] as String?,
    );

Map<String, dynamic> _$DataHistoryAdviseToJson(DataHistoryAdvise instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'advisory': instance.advisory,
      'issueType': instance.issueType,
      'appointmentDate': instance.appointmentDate,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'content': instance.content,
      'note': instance.note,
      'status': instance.status,
      'bcoin': instance.bcoin,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'appointmentDateStr': instance.appointmentDateStr,
    };

ListHistoryAdvise _$ListHistoryAdviseFromJson(Map<String, dynamic> json) =>
    ListHistoryAdvise(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataHistoryAdvise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHistoryAdviseToJson(ListHistoryAdvise instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListHistoryAdviseResponse _$ListHistoryAdviseResponseFromJson(
        Map<String, dynamic> json) =>
    ListHistoryAdviseResponse(
      json['data'] == null
          ? null
          : ListHistoryAdvise.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListHistoryAdviseResponseToJson(
        ListHistoryAdviseResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
