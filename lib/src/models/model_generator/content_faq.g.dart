// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFAQ _$ListFAQFromJson(Map<String, dynamic> json) => ListFAQ(
      json['q'] as String,
      json['a'] as String,
    );

Map<String, dynamic> _$ListFAQToJson(ListFAQ instance) => <String, dynamic>{
      'q': instance.q,
      'a': instance.a,
    };

DataContentFAQ _$DataContentFAQFromJson(Map<String, dynamic> json) =>
    DataContentFAQ(
      (json['data'] as List<dynamic>)
          .map((e) => ListFAQ.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataContentFAQToJson(DataContentFAQ instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataFAQ _$DataFAQFromJson(Map<String, dynamic> json) => DataFAQ(
      json['title'] as String?,
      DataContentFAQ.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataFAQToJson(DataFAQ instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };

ContentFAQResponse _$ContentFAQResponseFromJson(Map<String, dynamic> json) =>
    ContentFAQResponse(
      json['data'] == null
          ? null
          : DataFAQ.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ContentFAQResponseToJson(ContentFAQResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
