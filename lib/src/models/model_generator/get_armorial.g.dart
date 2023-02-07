// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_armorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YourArmorial _$YourArmorialFromJson(Map<String, dynamic> json) => YourArmorial(
      json['name'] as String?,
      json['username'] as String?,
      json['giftPerBook'] as int?,
      json['bcoinOfLevel'] as int?,
      json['myBook'] as int?,
      json['myBookRequireForUpAppellation'] as int?,
    );

Map<String, dynamic> _$YourArmorialToJson(YourArmorial instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'giftPerBook': instance.giftPerBook,
      'bcoinOfLevel': instance.bcoinOfLevel,
      'myBook': instance.myBook,
      'myBookRequireForUpAppellation': instance.myBookRequireForUpAppellation,
    };

YourArmorialResponse _$YourArmorialResponseFromJson(
        Map<String, dynamic> json) =>
    YourArmorialResponse(
      json['data'] == null
          ? null
          : YourArmorial.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$YourArmorialResponseToJson(
        YourArmorialResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
