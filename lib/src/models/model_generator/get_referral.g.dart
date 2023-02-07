// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReferralResponse _$GetReferralResponseFromJson(Map<String, dynamic> json) =>
    GetReferralResponse(
      json['data'] as String,
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetReferralResponseToJson(
        GetReferralResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
