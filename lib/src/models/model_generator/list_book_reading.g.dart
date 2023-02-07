// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_book_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceBookReading _$VoiceBookReadingFromJson(Map<String, dynamic> json) =>
    VoiceBookReading(
      json['name'] as String?,
      json['src'] as String?,
      json['index'] as int?,
      json['description'] as String?,
      (json['duration'] as num?)?.toDouble(),
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$VoiceBookReadingToJson(VoiceBookReading instance) =>
    <String, dynamic>{
      'name': instance.name,
      'src': instance.src,
      'index': instance.index,
      'description': instance.description,
      'duration': instance.duration,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

FileBookReading _$FileBookReadingFromJson(Map<String, dynamic> json) =>
    FileBookReading(
      json['name'] as String?,
      json['src'] as String?,
      json['key'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$FileBookReadingToJson(FileBookReading instance) =>
    <String, dynamic>{
      'name': instance.name,
      'src': instance.src,
      'key': instance.key,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ProductReadingData _$ProductReadingDataFromJson(Map<String, dynamic> json) =>
    ProductReadingData(
      json['_id'] as String?,
      json['name'] as String?,
      json['author'] as String?,
      json['category'] as String?,
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
          ?.map((e) => VoiceBookReading.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['file'] as List<dynamic>?)
          ?.map((e) => FileBookReading.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ProductReadingDataToJson(ProductReadingData instance) =>
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
    };

DataProductReading _$DataProductReadingFromJson(Map<String, dynamic> json) =>
    DataProductReading(
      json['_id'] as String?,
      json['__v'] as int?,
      json['user'] as String?,
      json['product'] == null
          ? null
          : ProductReadingData.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataProductReadingToJson(DataProductReading instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'product': instance.product,
      '__v': instance.v,
    };

ListBookReadingResponse _$ListBookReadingResponseFromJson(
        Map<String, dynamic> json) =>
    ListBookReadingResponse(
      (json['data'] as List<dynamic>)
          .map((e) => DataProductReading.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListBookReadingResponseToJson(
        ListBookReadingResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
