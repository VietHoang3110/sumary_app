// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_noti.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadNoti _$ReadNotiFromJson(Map<String, dynamic> json) => ReadNoti(
      json['_id'] as String?,
    );

Map<String, dynamic> _$ReadNotiToJson(ReadNoti instance) => <String, dynamic>{
      '_id': instance.id,
    };

ReadNotiResponse _$ReadNotiResponseFromJson(Map<String, dynamic> json) =>
    ReadNotiResponse(
      json['data'] == null
          ? null
          : ReadNotiResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ReadNotiResponseToJson(ReadNotiResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
