// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteSave _$QuoteSaveFromJson(Map<String, dynamic> json) => QuoteSave(
      json['_id'] as String?,
    );

Map<String, dynamic> _$QuoteSaveToJson(QuoteSave instance) => <String, dynamic>{
      '_id': instance.id,
    };

SaveQuoteResponse _$SaveQuoteResponseFromJson(Map<String, dynamic> json) =>
    SaveQuoteResponse(
      json['data'] == null
          ? null
          : SaveQuoteResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SaveQuoteResponseToJson(SaveQuoteResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
