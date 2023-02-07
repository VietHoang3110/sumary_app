// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRegister _$DataRegisterFromJson(Map<String, dynamic> json) => DataRegister(
      json['token'] as String,
    );

Map<String, dynamic> _$DataRegisterToJson(DataRegister instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      json['data'] == null
          ? null
          : DataRegister.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
