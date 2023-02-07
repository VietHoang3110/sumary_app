// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_history_appellation_received.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHistoryAppellation _$DataHistoryAppellationFromJson(
        Map<String, dynamic> json) =>
    DataHistoryAppellation(
      json['_id'] as String?,
      json['trans_code'] as String?,
      (json['bcoin_received'] as num?)?.toDouble(),
      json['read_books'] as int?,
      json['note'] as String?,
      json['create_at'] as String?,
    );

Map<String, dynamic> _$DataHistoryAppellationToJson(
        DataHistoryAppellation instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'trans_code': instance.trans_code,
      'bcoin_received': instance.bcoin_received,
      'read_books': instance.read_books,
      'note': instance.note,
      'create_at': instance.create_at,
    };

ListHistoryAppellation _$ListHistoryAppellationFromJson(
        Map<String, dynamic> json) =>
    ListHistoryAppellation(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map(
              (e) => DataHistoryAppellation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHistoryAppellationToJson(
        ListHistoryAppellation instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListHistoryAppellationResponse _$ListHistoryAppellationResponseFromJson(
        Map<String, dynamic> json) =>
    ListHistoryAppellationResponse(
      json['data'] == null
          ? null
          : ListHistoryAppellation.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListHistoryAppellationResponseToJson(
        ListHistoryAppellationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
