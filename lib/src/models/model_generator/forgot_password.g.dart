// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataForgotPassword _$DataForgotPasswordFromJson(Map<String, dynamic> json) =>
    DataForgotPassword(
      json['token'] as String,
    );

Map<String, dynamic> _$DataForgotPasswordToJson(DataForgotPassword instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      json['data'] == null
          ? null
          : DataForgotPassword.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
