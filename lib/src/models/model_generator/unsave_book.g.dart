// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsave_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookUnsave _$BookUnsaveFromJson(Map<String, dynamic> json) => BookUnsave(
      json['_id'] as String?,
    );

Map<String, dynamic> _$BookUnsaveToJson(BookUnsave instance) =>
    <String, dynamic>{
      '_id': instance.id,
    };

UnsaveBookResponse _$UnsaveBookResponseFromJson(Map<String, dynamic> json) =>
    UnsaveBookResponse(
      json['data'] == null
          ? null
          : UnsaveBookResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UnsaveBookResponseToJson(UnsaveBookResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
