// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataOtpRegister _$DataOtpRegisterFromJson(Map<String, dynamic> json) =>
    DataOtpRegister(
      json['token'] as String,
    );

Map<String, dynamic> _$DataOtpRegisterToJson(DataOtpRegister instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

OtpRegisterResponse _$OtpRegisterResponseFromJson(Map<String, dynamic> json) =>
    OtpRegisterResponse(
      json['data'] == null
          ? null
          : DataOtpRegister.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OtpRegisterResponseToJson(
        OtpRegisterResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
