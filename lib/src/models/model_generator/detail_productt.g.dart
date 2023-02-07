// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_productt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBookOfAuthor _$ListBookOfAuthorFromJson(Map<String, dynamic> json) =>
    ListBookOfAuthor(
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
      json['voiceTime'] as int?,
      (json['file'] as List<dynamic>?)
          ?.map((e) => DataFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['amount'] as int?,
      json['available'] as bool?,
      json['viewCount'] as int?,
      json['soldCount'] as int?,
      json['isActivated'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['slug'] as String?,
      json['isNew'] as bool?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$ListBookOfAuthorToJson(ListBookOfAuthor instance) =>
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
      'voiceTime': instance.voiceTime,
      'file': instance.file,
      'tags': instance.tags,
      'amount': instance.amount,
      'available': instance.available,
      'viewCount': instance.viewCount,
      'soldCount': instance.soldCount,
      'isActivated': instance.isActivated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
      'isNew': instance.isNew,
      '__v': instance.v,
    };

ListCategory _$ListCategoryFromJson(Map<String, dynamic> json) => ListCategory(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['parent'] as String?,
      json['enabled'] as bool?,
      json['author'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$ListCategoryToJson(ListCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parent': instance.parent,
      'enabled': instance.enabled,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      parent: json['parent'] as String?,
      enabled: json['enabled'] as bool?,
      author: json['author'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parent': instance.parent,
      'enabled': instance.enabled,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['isDeleted'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

DataFile _$DataFileFromJson(Map<String, dynamic> json) => DataFile(
      json['name'] as String?,
      json['key'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['src'] as String?,
    );

Map<String, dynamic> _$DataFileToJson(DataFile instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'src': instance.src,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

DataVoice _$DataVoiceFromJson(Map<String, dynamic> json) => DataVoice(
      json['name'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['description'] as String?,
      json['index'] as int?,
      (json['duration'] as num?)?.toDouble(),
      json['src'] as String?,
    );

Map<String, dynamic> _$DataVoiceToJson(DataVoice instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'src': instance.src,
      'index': instance.index,
      'duration': instance.duration,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

DataDetailProductFull _$DataDetailProductFullFromJson(
        Map<String, dynamic> json) =>
    DataDetailProductFull(
      json['_id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
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
      json['voiceTime'] as int?,
      (json['file'] as List<dynamic>?)
          ?.map((e) => DataFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['amount'] as int?,
      json['available'] as bool?,
      json['viewCount'] as int?,
      json['soldCount'] as int?,
      json['isActivated'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['slug'] as String?,
      json['__v'] as int?,
      json['isNew'] as bool?,
    );

Map<String, dynamic> _$DataDetailProductFullToJson(
        DataDetailProductFull instance) =>
    <String, dynamic>{
      '_id': instance.Id,
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
      'voiceTime': instance.voiceTime,
      'file': instance.file,
      'tags': instance.tags,
      'amount': instance.amount,
      'available': instance.available,
      'viewCount': instance.viewCount,
      'soldCount': instance.soldCount,
      'isActivated': instance.isActivated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
      '__v': instance.v,
      'isNew': instance.isNew,
    };

DataDetailProduct _$DataDetailProductFromJson(Map<String, dynamic> json) =>
    DataDetailProduct(
      json['book'] == null
          ? null
          : DataDetailProductFull.fromJson(
              json['book'] as Map<String, dynamic>),
      json['is_buy'] as bool,
      json['is_save'] as bool,
      json['total_done_chapter'] as int?,
    )
      ..listBookOfAuthor = (json['listBookOfAuthor'] as List<dynamic>?)
          ?.map((e) => ListBookOfAuthor.fromJson(e as Map<String, dynamic>))
          .toList()
      ..listCategory = (json['listCategory'] as List<dynamic>?)
          ?.map((e) => ListCategory.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DataDetailProductToJson(DataDetailProduct instance) =>
    <String, dynamic>{
      'book': instance.book,
      'is_buy': instance.is_buy,
      'is_save': instance.is_save,
      'total_done_chapter': instance.totalDoneChapter,
      'listBookOfAuthor': instance.listBookOfAuthor,
      'listCategory': instance.listCategory,
    };

DetailProductResponse _$DetailProductResponseFromJson(
        Map<String, dynamic> json) =>
    DetailProductResponse(
      json['data'] == null
          ? null
          : DataDetailProduct.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DetailProductResponseToJson(
        DetailProductResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
