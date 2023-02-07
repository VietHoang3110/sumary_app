// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_armorial_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Armorial _$ArmorialFromJson(Map<String, dynamic> json) => Armorial(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['bookRequired'] as int?,
      json['giftPerBook'] as int?,
      json['bcoinOfLevel'] as int?,
      json['author'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
      json['editor'] as String?,
    );

Map<String, dynamic> _$ArmorialToJson(Armorial instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'bookRequired': instance.bookRequired,
      'giftPerBook': instance.giftPerBook,
      'bcoinOfLevel': instance.bcoinOfLevel,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'editor': instance.editor,
    };

ListArmorial _$ListArmorialFromJson(Map<String, dynamic> json) => ListArmorial(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>)
          .map((e) => Armorial.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListArmorialToJson(ListArmorial instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListArmorialResponse _$ListArmorialResponseFromJson(
        Map<String, dynamic> json) =>
    ListArmorialResponse(
      ListArmorial.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListArmorialResponseToJson(
        ListArmorialResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
