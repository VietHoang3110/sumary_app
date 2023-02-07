// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_advise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdvise _$CreateAdviseFromJson(Map<String, dynamic> json) => CreateAdvise(
      name: json['name'] as String,
      issueType: json['issueType'] as String,
      appointmentDate: json['appointmentDate'] as String,
      phoneNumber: json['phoneNumber'] as int,
      email: json['email'] as String,
      content: json['content'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$CreateAdviseToJson(CreateAdvise instance) =>
    <String, dynamic>{
      'name': instance.name,
      'issueType': instance.issueType,
      'appointmentDate': instance.appointmentDate,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'content': instance.content,
      'note': instance.note,
    };

CreateAdviseResponse _$CreateAdviseResponseFromJson(
        Map<String, dynamic> json) =>
    CreateAdviseResponse(
      json['data'] == null
          ? null
          : CreateAdviseResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateAdviseResponseToJson(
        CreateAdviseResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
