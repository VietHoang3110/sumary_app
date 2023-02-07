// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['_id'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      '_id': instance.id,
    };

SaveBookResponse _$SaveBookResponseFromJson(Map<String, dynamic> json) =>
    SaveBookResponse(
      json['data'] == null
          ? null
          : SaveBookResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SaveBookResponseToJson(SaveBookResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
