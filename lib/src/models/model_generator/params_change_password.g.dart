// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_change_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamChangePassword _$ParamChangePasswordFromJson(Map<String, dynamic> json) =>
    ParamChangePassword(
      oldPass: json['old_password'] as String,
      newPass: json['password_new'] as String,
      repeatPass: json['password_new_confirmation'] as String,
    );

Map<String, dynamic> _$ParamChangePasswordToJson(
        ParamChangePassword instance) =>
    <String, dynamic>{
      'old_password': instance.oldPass,
      'password_new': instance.newPass,
      'password_new_confirmation': instance.repeatPass,
    };

ParamForgotPassword _$ParamForgotPasswordFromJson(Map<String, dynamic> json) =>
    ParamForgotPassword(
      email: json['email'] as String,
    );

Map<String, dynamic> _$ParamForgotPasswordToJson(
        ParamForgotPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

ParamResetPassword _$ParamResetPasswordFromJson(Map<String, dynamic> json) =>
    ParamResetPassword(
      email: json['email'] as String,
      newPass: json['new_password'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ParamResetPasswordToJson(ParamResetPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
      'new_password': instance.newPass,
      'token': instance.token,
    };
