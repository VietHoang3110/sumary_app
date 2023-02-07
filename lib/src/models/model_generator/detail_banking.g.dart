// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_banking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banking _$BankingFromJson(Map<String, dynamic> json) => Banking(
      json['_id'] as String?,
    );

Map<String, dynamic> _$BankingToJson(Banking instance) => <String, dynamic>{
      '_id': instance.id,
    };

DetailBanking _$DetailBankingFromJson(Map<String, dynamic> json) =>
    DetailBanking(
      json['bank_account'] as String,
      json['bank_name'] as String,
      json['owner_name'] as String,
      json['transfer_content'] as String,
    );

Map<String, dynamic> _$DetailBankingToJson(DetailBanking instance) =>
    <String, dynamic>{
      'bank_account': instance.bank_account,
      'bank_name': instance.bank_name,
      'owner_name': instance.owner_name,
      'transfer_content': instance.transfer_content,
    };

DetailBankingResponse _$DetailBankingResponseFromJson(
        Map<String, dynamic> json) =>
    DetailBankingResponse(
      json['data'] == null
          ? null
          : DetailBanking.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DetailBankingResponseToJson(
        DetailBankingResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
