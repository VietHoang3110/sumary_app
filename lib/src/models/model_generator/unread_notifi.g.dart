// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_notifi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnreadNotifiResponse _$UnreadNotifiResponseFromJson(
        Map<String, dynamic> json) =>
    UnreadNotifiResponse(
      json['data'] as int,
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UnreadNotifiResponseToJson(
        UnreadNotifiResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
