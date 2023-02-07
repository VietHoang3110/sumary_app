// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataNotification _$DataNotificationFromJson(Map<String, dynamic> json) =>
    DataNotification(
      json['_id'] as String,
      json['title'] as String?,
      json['content'] as String?,
      json['description'] as String?,
      json['isRead'] as bool?,
      json['isActivated'] as bool?,
      json['author'] as String?,
      json['createdAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataNotificationToJson(DataNotification instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'description': instance.description,
      'isRead': instance.isRead,
      'isActivated': instance.isActivated,
      'author': instance.author,
      'createdAt': instance.createdAt,
      '__v': instance.v,
    };

ListNotification _$ListNotificationFromJson(Map<String, dynamic> json) =>
    ListNotification(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNotificationToJson(ListNotification instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListNotificationResponse _$ListNotificationResponseFromJson(
        Map<String, dynamic> json) =>
    ListNotificationResponse(
      json['data'] == null
          ? null
          : ListNotification.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListNotificationResponseToJson(
        ListNotificationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
