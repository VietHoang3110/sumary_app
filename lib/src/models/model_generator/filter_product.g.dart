// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFilter _$ProductFilterFromJson(Map<String, dynamic> json) =>
    ProductFilter(
      json['_id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
      json['author'] as String?,
      json['category'] as String?,
      (json['filter'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['translator'] as String?,
      json['publishingYear'] as int?,
      json['type'] as String?,
      json['numberOfPage'] as int?,
      json['description'] as String?,
      json['image'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['prePrice'] as int?,
      json['price'] as int?,
      (json['avgVoiceRate'] as num?)?.toDouble(),
      (json['avgContentRate'] as num?)?.toDouble(),
      (json['avgRate'] as num?)?.toDouble(),
      json['language'] as String?,
      (json['voice'] as List<dynamic>?)
          ?.map((e) => DataVoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['file'] as List<dynamic>?)
          ?.map((e) => DataFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['voiceTime'] as int?,
      json['amount'] as int?,
      json['available'] as bool?,
      json['viewCount'] as int?,
      json['soldCount'] as int?,
      json['isActivated'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['slug'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$ProductFilterToJson(ProductFilter instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'author': instance.author,
      'category': instance.category,
      'filter': instance.filter,
      'translator': instance.translator,
      'publishingYear': instance.publishingYear,
      'type': instance.type,
      'numberOfPage': instance.numberOfPage,
      'description': instance.description,
      'image': instance.image,
      'images': instance.images,
      'prePrice': instance.prePrice,
      'price': instance.price,
      'avgVoiceRate': instance.avgVoiceRate,
      'avgContentRate': instance.avgContentRate,
      'avgRate': instance.avgRate,
      'language': instance.language,
      'voice': instance.voice,
      'file': instance.file,
      'tags': instance.tags,
      'voiceTime': instance.voiceTime,
      'amount': instance.amount,
      'available': instance.available,
      'viewCount': instance.viewCount,
      'soldCount': instance.soldCount,
      'isActivated': instance.isActivated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
      '__v': instance.v,
    };

ProductFilterResponse _$ProductFilterResponseFromJson(
        Map<String, dynamic> json) =>
    ProductFilterResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProductFilterResponseToJson(
        ProductFilterResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
