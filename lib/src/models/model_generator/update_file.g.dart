// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataFile _$DataFileFromJson(Map<String, dynamic> json) => DataFile(
      json['fileId'] as String?,
      json['fullUrl'] as String?,
    );

Map<String, dynamic> _$DataFileToJson(DataFile instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'fullUrl': instance.fullUrl,
    };

DataFileUpdate _$DataFileUpdateFromJson(Map<String, dynamic> json) =>
    DataFileUpdate(
      json['data'] == null
          ? null
          : DataFile.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DataFileUpdateToJson(DataFileUpdate instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
