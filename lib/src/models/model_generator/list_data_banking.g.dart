// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_data_banking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBanking _$DataBankingFromJson(Map<String, dynamic> json) => DataBanking(
      json['_id'] as String?,
      json['bank_name'] as String?,
      json['icon_url'] as String?,
      json['owner_name'] as String?,
      json['bank_account'] as String?,
      json['activate'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataBankingToJson(DataBanking instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bank_name': instance.bank_name,
      'icon_url': instance.icon_url,
      'owner_name': instance.owner_name,
      'bank_account': instance.bank_account,
      'activate': instance.activate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

ListDataBankingResponse _$ListDataBankingResponseFromJson(
        Map<String, dynamic> json) =>
    ListDataBankingResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataBanking.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListDataBankingResponseToJson(
        ListDataBankingResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
