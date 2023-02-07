// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataMembersShip _$DataMembersShipFromJson(Map<String, dynamic> json) =>
    DataMembersShip(
      json['id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      (json['bcoin'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DataMembersShipToJson(DataMembersShip instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'bcoin': instance.bcoin,
    };

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
      json['name'] as String,
      json['avatar'] as String?,
      json['email'] as String,
      json['phone'] as String?,
      json['gender'] as bool?,
      json['dob'] as String?,
      json['referralId'] as String?,
      (json['bcoin'] as num?)?.toDouble(),
      json['membership'] == null
          ? null
          : DataMembersShip.fromJson(
              json['membership'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'dob': instance.dob,
      'referralId': instance.referralId,
      'bcoin': instance.bcoin,
      'membership': instance.membership,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      data: json['data'] == null
          ? null
          : DataUser.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
