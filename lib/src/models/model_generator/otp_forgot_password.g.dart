// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_forgot_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataOtpForgot _$DataOtpForgotFromJson(Map<String, dynamic> json) =>
    DataOtpForgot(
      json['token'] as String,
    );

Map<String, dynamic> _$DataOtpForgotToJson(DataOtpForgot instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

OtpForgotResponse _$OtpForgotResponseFromJson(Map<String, dynamic> json) =>
    OtpForgotResponse(
      json['data'] == null
          ? null
          : DataOtpForgot.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OtpForgotResponseToJson(OtpForgotResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
