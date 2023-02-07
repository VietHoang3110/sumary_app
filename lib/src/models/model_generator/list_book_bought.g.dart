// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_book_bought.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAuthor _$DataAuthorFromJson(Map<String, dynamic> json) => DataAuthor(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['isDeleted'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataAuthorToJson(DataAuthor instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

ProductBoughtData _$ProductBoughtDataFromJson(Map<String, dynamic> json) =>
    ProductBoughtData(
      json['_id'] as String?,
      json['name'] as String?,
      json['author'] == null
          ? null
          : DataAuthor.fromJson(json['author'] as Map<String, dynamic>),
      json['image'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProductBoughtDataToJson(ProductBoughtData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'image': instance.image,
      'images': instance.images,
      'updatedAt': instance.updatedAt,
    };

DataProductBought _$DataProductBoughtFromJson(Map<String, dynamic> json) =>
    DataProductBought(
      json['_id'] as String?,
      json['__v'] as int?,
      json['user'] as String?,
      json['product'] == null
          ? null
          : ProductBoughtData.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataProductBoughtToJson(DataProductBought instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'product': instance.product,
      '__v': instance.v,
    };

ListProductBought _$ListProductBoughtFromJson(Map<String, dynamic> json) =>
    ListProductBought(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>)
          .map((e) => DataProductBought.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductBoughtToJson(ListProductBought instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListBookBoughtResponse _$ListBookBoughtResponseFromJson(
        Map<String, dynamic> json) =>
    ListBookBoughtResponse(
      ListProductBought.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListBookBoughtResponseToJson(
        ListBookBoughtResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
