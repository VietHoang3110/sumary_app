// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAppRequest _$LoginAppRequestFromJson(Map<String, dynamic> json) =>
    LoginAppRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      token_firebase: json['token_firebase'] as String,
    );

Map<String, dynamic> _$LoginAppRequestToJson(LoginAppRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'token_firebase': instance.token_firebase,
    };

LoginGoogleAndFacebookRequest _$LoginGoogleAndFacebookRequestFromJson(
        Map<String, dynamic> json) =>
    LoginGoogleAndFacebookRequest(
      token: json['token'] as String,
      token_device: json['token_device'] as String,
    );

Map<String, dynamic> _$LoginGoogleAndFacebookRequestToJson(
        LoginGoogleAndFacebookRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_device': instance.token_device,
    };
