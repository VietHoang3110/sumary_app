// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_top_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceTopView _$VoiceTopViewFromJson(Map<String, dynamic> json) => VoiceTopView(
      json['name'] as String?,
      json['src'] as String?,
      json['index'] as int?,
      json['description'] as String?,
      (json['duration'] as num?)?.toDouble(),
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$VoiceTopViewToJson(VoiceTopView instance) =>
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

FileTopView _$FileTopViewFromJson(Map<String, dynamic> json) => FileTopView(
      json['name'] as String?,
      json['src'] as String?,
      json['key'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$FileTopViewToJson(FileTopView instance) =>
    <String, dynamic>{
      'name': instance.name,
      'src': instance.src,
      'key': instance.key,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ListTopView _$ListTopViewFromJson(Map<String, dynamic> json) => ListTopView(
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
          ?.map((e) => VoiceTopView.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['file'] as List<dynamic>?)
          ?.map((e) => FileTopView.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListTopViewToJson(ListTopView instance) =>
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
      '__v': instance.v,
    };

ListTopViewResponse _$ListTopViewResponseFromJson(Map<String, dynamic> json) =>
    ListTopViewResponse(
      (json['data'] as List<dynamic>)
          .map((e) => ListTopView.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListTopViewResponseToJson(
        ListTopViewResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
