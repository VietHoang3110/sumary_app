// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['isDeleted'] as bool?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
      '__v': instance.v,
    };

DataCate _$DataCateFromJson(Map<String, dynamic> json) => DataCate(
      json['_id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$DataCateToJson(DataCate instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

DataProduct _$DataProductFromJson(Map<String, dynamic> json) => DataProduct(
      json['_id'] as String?,
      json['name'] as String?,
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : DataCate.fromJson(json['category'] as Map<String, dynamic>),
      (json['filter'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['mood'] as String?,
      json['reason'] as String?,
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
      (json['voice'] as List<dynamic>?)
          ?.map((e) => DataVoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['file'] as List<dynamic>?)
          ?.map((e) => DataFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['amount'] as int?,
      json['available'] as bool?,
      json['viewCount'] as int?,
      json['soldCount'] as int?,
      json['isActivated'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['slug'] as String?,
      json['__v'] as int?,
      json['code'] as String?,
      json['voiceTime'] as int?,
    );

Map<String, dynamic> _$DataProductToJson(DataProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'category': instance.category,
      'filter': instance.filter,
      'mood': instance.mood,
      'reason': instance.reason,
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
      'voice': instance.voice,
      'file': instance.file,
      'amount': instance.amount,
      'available': instance.available,
      'viewCount': instance.viewCount,
      'soldCount': instance.soldCount,
      'isActivated': instance.isActivated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
      '__v': instance.v,
      'code': instance.code,
      'voiceTime': instance.voiceTime,
    };

ListProduct _$ListProductFromJson(Map<String, dynamic> json) => ListProduct(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>)
          .map((e) => DataProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductToJson(ListProduct instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListProductResponse _$ListProductResponseFromJson(Map<String, dynamic> json) =>
    ListProductResponse(
      json['data'] == null
          ? null
          : ListProduct.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListProductResponseToJson(
        ListProductResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
