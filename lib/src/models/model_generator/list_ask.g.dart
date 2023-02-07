// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAks _$DataAksFromJson(Map<String, dynamic> json) => DataAks(
      json['_id'] as String,
      json['user'] as String,
      json['product'] as String,
      json['name'] as String?,
      json['question'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
      json['answer'] as String?,
      json['answerer'] as String?,
    );

Map<String, dynamic> _$DataAksToJson(DataAks instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'product': instance.product,
      'name': instance.name,
      'question': instance.question,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'answer': instance.answer,
      'answerer': instance.answerer,
    };

ListAsk _$ListAskFromJson(Map<String, dynamic> json) => ListAsk(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>)
          .map((e) => DataAks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListAskToJson(ListAsk instance) => <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListAskResponse _$ListAskResponseFromJson(Map<String, dynamic> json) =>
    ListAskResponse(
      ListAsk.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListAskResponseToJson(ListAskResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
