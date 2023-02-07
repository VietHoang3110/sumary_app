// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_terms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataTerms _$DataTermsFromJson(Map<String, dynamic> json) => DataTerms(
      json['title'] as String?,
      json['content'] as String?,
    );

Map<String, dynamic> _$DataTermsToJson(DataTerms instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };

ContentTermsResponse _$ContentTermsResponseFromJson(
        Map<String, dynamic> json) =>
    ContentTermsResponse(
      json['data'] == null
          ? null
          : DataTerms.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ContentTermsResponseToJson(
        ContentTermsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
