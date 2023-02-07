// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_book_pdf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileBookPdfResponse _$FileBookPdfResponseFromJson(Map<String, dynamic> json) =>
    FileBookPdfResponse(
      json['data'] as String,
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$FileBookPdfResponseToJson(
        FileBookPdfResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
