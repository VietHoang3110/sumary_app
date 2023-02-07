// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_rate_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['_id'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      '_id': instance.id,
    };

CreateRate _$CreateRateFromJson(Map<String, dynamic> json) => CreateRate(
      voiceStar: json['voiceStar'] as int,
      contentStar: json['contentStar'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CreateRateToJson(CreateRate instance) =>
    <String, dynamic>{
      'voiceStar': instance.voiceStar,
      'contentStar': instance.contentStar,
      'content': instance.content,
    };

CreateRateResponse _$CreateRateResponseFromJson(Map<String, dynamic> json) =>
    CreateRateResponse(
      json['data'] == null
          ? null
          : CreateRateResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateRateResponseToJson(CreateRateResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
