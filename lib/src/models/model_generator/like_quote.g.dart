// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteLike _$QuoteLikeFromJson(Map<String, dynamic> json) => QuoteLike(
      json['_id'] as String?,
    );

Map<String, dynamic> _$QuoteLikeToJson(QuoteLike instance) => <String, dynamic>{
      '_id': instance.id,
    };

LikeQuoteResponse _$LikeQuoteResponseFromJson(Map<String, dynamic> json) =>
    LikeQuoteResponse(
      json['data'] == null
          ? null
          : LikeQuoteResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LikeQuoteResponseToJson(LikeQuoteResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
