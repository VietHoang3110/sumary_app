// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_book_saved.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileBook _$FileBookFromJson(Map<String, dynamic> json) => FileBook(
      json['name'] as String?,
      json['src'] as String?,
      json['key'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$FileBookToJson(FileBook instance) => <String, dynamic>{
      'name': instance.name,
      'src': instance.src,
      'key': instance.key,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

VoiceBook _$VoiceBookFromJson(Map<String, dynamic> json) => VoiceBook(
      json['name'] as String?,
      json['src'] as String?,
      json['index'] as int?,
      json['description'] as String?,
      (json['duration'] as num?)?.toDouble(),
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$VoiceBookToJson(VoiceBook instance) => <String, dynamic>{
      'name': instance.name,
      'src': instance.src,
      'index': instance.index,
      'description': instance.description,
      'duration': instance.duration,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ProductSavedData _$ProductSavedDataFromJson(Map<String, dynamic> json) =>
    ProductSavedData(
      json['_id'] as String?,
      json['name'] as String?,
      json['author'] as String?,
      json['category'] as String?,
      json['mood'] as String?,
      json['reason'] as String?,
      json['translator'] as String?,
      json['publishingYear'] as int?,
      json['type'] as String?,
      json['numberOfPage'] as int?,
      json['description'] as String?,
      json['image'] as String?,
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      json['prePrice'] as int?,
      json['price'] as int?,
      (json['avgVoiceRate'] as num?)?.toDouble(),
      (json['avgContentRate'] as num?)?.toDouble(),
      json['language'] as String?,
      (json['voice'] as List<dynamic>?)
          ?.map((e) => VoiceBook.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['file'] as List<dynamic>?)
          ?.map((e) => FileBook.fromJson(e as Map<String, dynamic>))
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
    );

Map<String, dynamic> _$ProductSavedDataToJson(ProductSavedData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'category': instance.category,
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
      'language': instance.language,
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
    };

DataProductSaved _$DataProductSavedFromJson(Map<String, dynamic> json) =>
    DataProductSaved(
      json['_id'] as String?,
      json['__v'] as int?,
      json['user'] as String?,
      json['product'] == null
          ? null
          : ProductSavedData.fromJson(json['product'] as Map<String, dynamic>),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DataProductSavedToJson(DataProductSaved instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'product': instance.product,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

ListProductSaved _$ListProductSavedFromJson(Map<String, dynamic> json) =>
    ListProductSaved(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataProductSaved.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductSavedToJson(ListProductSaved instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListBookSavedResponse _$ListBookSavedResponseFromJson(
        Map<String, dynamic> json) =>
    ListBookSavedResponse(
      json['data'] == null
          ? null
          : ListProductSaved.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListBookSavedResponseToJson(
        ListBookSavedResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
