// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_history_affiliate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

dataUser _$dataUserFromJson(Map<String, dynamic> json) => dataUser(
      json['_id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$dataUserToJson(dataUser instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

DataHistoryAffiliate _$DataHistoryAffiliateFromJson(
        Map<String, dynamic> json) =>
    DataHistoryAffiliate(
      json['_id'] as String?,
      json['recharge_code'] as String?,
      json['user'] == null
          ? null
          : dataUser.fromJson(json['user'] as Map<String, dynamic>),
      json['userCharged'] == null
          ? null
          : dataUser.fromJson(json['userCharged'] as Map<String, dynamic>),
      (json['bcoin'] as num?)?.toDouble(),
      json['note'] as String?,
      json['create_at'] as String?,
    );

Map<String, dynamic> _$DataHistoryAffiliateToJson(
        DataHistoryAffiliate instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'recharge_code': instance.recharge_code,
      'user': instance.user,
      'userCharged': instance.userCharged,
      'bcoin': instance.bcoin,
      'note': instance.note,
      'create_at': instance.create_at,
    };

ListHistoryAffiliate _$ListHistoryAffiliateFromJson(
        Map<String, dynamic> json) =>
    ListHistoryAffiliate(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataHistoryAffiliate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHistoryAffiliateToJson(
        ListHistoryAffiliate instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListHistoryAffiliateResponse _$ListHistoryAffiliateResponseFromJson(
        Map<String, dynamic> json) =>
    ListHistoryAffiliateResponse(
      json['data'] == null
          ? null
          : ListHistoryAffiliate.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListHistoryAffiliateResponseToJson(
        ListHistoryAffiliateResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
