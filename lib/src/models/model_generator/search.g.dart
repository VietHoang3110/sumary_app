// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
      json['isDeleted'] as bool,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'isDeleted': instance.isDeleted,
    };

RecordsData _$RecordsDataFromJson(Map<String, dynamic> json) => RecordsData(
      json['_id'] as String?,
      json['name'] as String?,
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : DataCate.fromJson(json['category'] as Map<String, dynamic>),
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
      json['__v'] as int?,
    );

Map<String, dynamic> _$RecordsDataToJson(RecordsData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
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

DataSearch _$DataSearchFromJson(Map<String, dynamic> json) => DataSearch(
      (json['records'] as List<dynamic>?)
          ?.map((e) => RecordsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
    );

Map<String, dynamic> _$DataSearchToJson(DataSearch instance) =>
    <String, dynamic>{
      'records': instance.records,
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
    };

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      json['data'] == null
          ? null
          : DataSearch.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
