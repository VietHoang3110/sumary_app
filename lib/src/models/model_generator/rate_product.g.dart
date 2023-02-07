// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['_id'] as String?,
      json['name'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

DataRateProduct _$DataRateProductFromJson(Map<String, dynamic> json) =>
    DataRateProduct(
      id: json['_id'] as String?,
      content: json['content'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      product: json['product'] as String?,
      voiceStar: json['voiceStar'] as int?,
      contentStar: json['contentStar'] as int?,
      lover:
          (json['lover'] as List<dynamic>?)?.map((e) => e as String).toList(),
      accepted: json['accepted'] as bool?,
      replies:
          (json['replies'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
      isLoved: json['isLoved'] as bool?,
    );

Map<String, dynamic> _$DataRateProductToJson(DataRateProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'user': instance.user,
      'product': instance.product,
      'voiceStar': instance.voiceStar,
      'contentStar': instance.contentStar,
      'lover': instance.lover,
      'accepted': instance.accepted,
      'replies': instance.replies,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'isLoved': instance.isLoved,
    };

ListRateProduct _$ListRateProductFromJson(Map<String, dynamic> json) =>
    ListRateProduct(
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataRateProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
    );

Map<String, dynamic> _$ListRateProductToJson(ListRateProduct instance) =>
    <String, dynamic>{
      'records': instance.records,
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
    };

RateProductResponse _$RateProductResponseFromJson(Map<String, dynamic> json) =>
    RateProductResponse(
      json['data'] == null
          ? null
          : ListRateProduct.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RateProductResponseToJson(
        RateProductResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
