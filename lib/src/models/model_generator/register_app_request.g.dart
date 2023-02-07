// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAppRequest _$RegisterAppRequestFromJson(Map<String, dynamic> json) =>
    RegisterAppRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      referrer: json['referrer'] as String?,
    );

Map<String, dynamic> _$RegisterAppRequestToJson(RegisterAppRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'referrer': instance.referrer,
    };
