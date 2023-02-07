// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['_id'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      '_id': instance.id,
    };

CreateAsk _$CreateAskFromJson(Map<String, dynamic> json) => CreateAsk(
      name: json['name'] as String,
      question: json['question'] as String,
    );

Map<String, dynamic> _$CreateAskToJson(CreateAsk instance) => <String, dynamic>{
      'name': instance.name,
      'question': instance.question,
    };

CreateAskResponse _$CreateAskResponseFromJson(Map<String, dynamic> json) =>
    CreateAskResponse(
      json['data'] == null
          ? null
          : CreateAskResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateAskResponseToJson(CreateAskResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
