// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidesData _$SlidesDataFromJson(Map<String, dynamic> json) => SlidesData(
      json['image'] as String?,
      json['text'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SlidesDataToJson(SlidesData instance) =>
    <String, dynamic>{
      'image': instance.image,
      'text': instance.text,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

DataQuote _$DataQuoteFromJson(Map<String, dynamic> json) => DataQuote(
      id: json['_id'] as String?,
      product: json['product'] as String?,
      url: json['url'] as String?,
      lover:
          (json['lover'] as List<dynamic>?)?.map((e) => e as String).toList(),
      saved:
          (json['saved'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isActivated: json['isActivated'] as bool?,
      slides: (json['slides'] as List<dynamic>?)
          ?.map((e) => SlidesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
      isLoved: json['isLoved'] as bool?,
      isSaved: json['isSaved'] as bool?,
    );

Map<String, dynamic> _$DataQuoteToJson(DataQuote instance) => <String, dynamic>{
      '_id': instance.id,
      'product': instance.product,
      'url': instance.url,
      'lover': instance.lover,
      'saved': instance.saved,
      'isActivated': instance.isActivated,
      'slides': instance.slides,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'isLoved': instance.isLoved,
      'isSaved': instance.isSaved,
    };

ListQuoteResponse _$ListQuoteResponseFromJson(Map<String, dynamic> json) =>
    ListQuoteResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataQuote.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListQuoteResponseToJson(ListQuoteResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
