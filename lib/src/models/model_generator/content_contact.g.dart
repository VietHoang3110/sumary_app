// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataContentContactAddresses _$DataContentContactAddressesFromJson(
        Map<String, dynamic> json) =>
    DataContentContactAddresses(
      json['location'] as String,
    );

Map<String, dynamic> _$DataContentContactAddressesToJson(
        DataContentContactAddresses instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

DataContentContact _$DataContentContactFromJson(Map<String, dynamic> json) =>
    DataContentContact(
      json['phone'] as String,
      json['email'] as String,
      json['website'] as String,
      json['fanpage'] as String,
      (json['addresses'] as List<dynamic>)
          .map((e) =>
              DataContentContactAddresses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataContentContactToJson(DataContentContact instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'fanpage': instance.fanpage,
      'addresses': instance.addresses,
    };

ContentContact _$ContentContactFromJson(Map<String, dynamic> json) =>
    ContentContact(
      DataContentContact.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentContactToJson(ContentContact instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataContact _$DataContactFromJson(Map<String, dynamic> json) => DataContact(
      json['title'] as String?,
      ContentContact.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataContactToJson(DataContact instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };

ContentContactResponse _$ContentContactResponseFromJson(
        Map<String, dynamic> json) =>
    ContentContactResponse(
      json['data'] == null
          ? null
          : DataContact.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ContentContactResponseToJson(
        ContentContactResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
