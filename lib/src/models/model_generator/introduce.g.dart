// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introduce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroduceResponse _$IntroduceResponseFromJson(Map<String, dynamic> json) =>
    IntroduceResponse(
      (json['data'] as List<dynamic>)
          .map((e) => IntroduceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$IntroduceResponseToJson(IntroduceResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

IntroduceData _$IntroduceDataFromJson(Map<String, dynamic> json) =>
    IntroduceData(
      json['_id'] as String,
      json['order'] as int,
      json['pathImage'] as String,
      json['title'] as String,
      json['content'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
    );

Map<String, dynamic> _$IntroduceDataToJson(IntroduceData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'order': instance.order,
      'pathImage': instance.pathImage,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
