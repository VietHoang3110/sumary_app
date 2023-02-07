// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_change_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamChangeInfo _$ParamChangeInfoFromJson(Map<String, dynamic> json) =>
    ParamChangeInfo(
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ParamChangeInfoToJson(ParamChangeInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'phone': instance.phone,
    };

ParamChangeInfoNotImage _$ParamChangeInfoNotImageFromJson(
        Map<String, dynamic> json) =>
    ParamChangeInfoNotImage(
      phone: json['phone'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ParamChangeInfoNotImageToJson(
        ParamChangeInfoNotImage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };

ParamChangeInfoAvatar _$ParamChangeInfoAvatarFromJson(
        Map<String, dynamic> json) =>
    ParamChangeInfoAvatar(
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$ParamChangeInfoAvatarToJson(
        ParamChangeInfoAvatar instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
    };
