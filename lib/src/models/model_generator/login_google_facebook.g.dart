// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_google_facebook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataLoginGGAndFB _$DataLoginGGAndFBFromJson(Map<String, dynamic> json) =>
    DataLoginGGAndFB(
      json['token'] as String,
    );

Map<String, dynamic> _$DataLoginGGAndFBToJson(DataLoginGGAndFB instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

LogoFBAndGGResponse _$LogoFBAndGGResponseFromJson(Map<String, dynamic> json) =>
    LogoFBAndGGResponse(
      DataLoginGGAndFB.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LogoFBAndGGResponseToJson(
        LogoFBAndGGResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
