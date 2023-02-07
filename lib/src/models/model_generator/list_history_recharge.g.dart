// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_history_recharge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHistoryRecharge _$DataHistoryRechargeFromJson(Map<String, dynamic> json) =>
    DataHistoryRecharge(
      json['_id'] as String?,
      json['recharge_code'] as String?,
      (json['bcoin'] as num?)?.toDouble(),
      json['amount'] as int?,
      json['method'] as String?,
      json['create_at'] as String?,
      json['create_by'] as String?,
      json['is_deleted'] as bool?,
    );

Map<String, dynamic> _$DataHistoryRechargeToJson(
        DataHistoryRecharge instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'recharge_code': instance.recharge_code,
      'bcoin': instance.bcoin,
      'amount': instance.amount,
      'method': instance.method,
      'create_at': instance.create_at,
      'create_by': instance.create_by,
      'is_deleted': instance.is_deleted,
    };

ListHistoryRecharge _$ListHistoryRechargeFromJson(Map<String, dynamic> json) =>
    ListHistoryRecharge(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataHistoryRecharge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHistoryRechargeToJson(
        ListHistoryRecharge instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListHistoryRechargeResponse _$ListHistoryRechargeResponseFromJson(
        Map<String, dynamic> json) =>
    ListHistoryRechargeResponse(
      json['data'] == null
          ? null
          : ListHistoryRecharge.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListHistoryRechargeResponseToJson(
        ListHistoryRechargeResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
