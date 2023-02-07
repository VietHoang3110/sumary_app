// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBanner _$DataBannerFromJson(Map<String, dynamic> json) => DataBanner(
      json['_id'] as String?,
      json['author'] as String?,
      json['link'] as String?,
      json['imageUrl'] as String?,
      json['enabled'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataBannerToJson(DataBanner instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'link': instance.link,
      'imageUrl': instance.imageUrl,
      'enabled': instance.enabled,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

ListBanner _$ListBannerFromJson(Map<String, dynamic> json) => ListBanner(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>)
          .map((e) => DataBanner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListBannerToJson(ListBanner instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListBannerResponse _$ListBannerResponseFromJson(Map<String, dynamic> json) =>
    ListBannerResponse(
      ListBanner.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListBannerResponseToJson(ListBannerResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
