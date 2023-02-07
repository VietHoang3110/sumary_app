// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_resend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataOtpResend _$DataOtpResendFromJson(Map<String, dynamic> json) =>
    DataOtpResend(
      json['token'] as String,
    );

Map<String, dynamic> _$DataOtpResendToJson(DataOtpResend instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

OtpResendResponse _$OtpResendResponseFromJson(Map<String, dynamic> json) =>
    OtpResendResponse(
      json['data'] == null
          ? null
          : DataOtpResend.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OtpResendResponseToJson(OtpResendResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
