// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataLogin _$DataLoginFromJson(Map<String, dynamic> json) => DataLogin(
      json['token'] as String,
    );

Map<String, dynamic> _$DataLoginToJson(DataLogin instance) => <String, dynamic>{
      'token': instance.token,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['data'] == null
          ? null
          : DataLogin.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
