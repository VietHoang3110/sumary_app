// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_book_done.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProductDone _$DataProductDoneFromJson(Map<String, dynamic> json) =>
    DataProductDone(
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
      json['language'] as String?,
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
      (json['avgRate'] as num?)?.toDouble(),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataProductDoneToJson(DataProductDone instance) =>
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
      'avgRate': instance.avgRate,
      'tags': instance.tags,
      '__v': instance.v,
    };

ListProductDone _$ListProductDoneFromJson(Map<String, dynamic> json) =>
    ListProductDone(
      json['_id'] as String?,
      json['user'] as String?,
      json['doneChapter'] as int?,
      json['product'] == null
          ? null
          : DataProductDone.fromJson(json['product'] as Map<String, dynamic>),
      json['__v'] as int?,
      json['isDone'] as bool?,
    );

Map<String, dynamic> _$ListProductDoneToJson(ListProductDone instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'doneChapter': instance.doneChapter,
      'product': instance.product,
      '__v': instance.v,
      'isDone': instance.isDone,
    };

ListBookDoneResponse _$ListBookDoneResponseFromJson(
        Map<String, dynamic> json) =>
    ListBookDoneResponse(
      (json['data'] as List<dynamic>)
          .map((e) => ListProductDone.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListBookDoneResponseToJson(
        ListBookDoneResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
