// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataOfferPackage _$DataOfferPackageFromJson(Map<String, dynamic> json) =>
    DataOfferPackage(
      json['_id'] as String?,
      json['title'] as String?,
      json['savePercent'] as int?,
      json['type'] as int?,
      json['cost'] as int?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataOfferPackageToJson(DataOfferPackage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'savePercent': instance.savePercent,
      'type': instance.type,
      'cost': instance.cost,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

OfferPackageResponse _$OfferPackageResponseFromJson(
        Map<String, dynamic> json) =>
    OfferPackageResponse(
      (json['data'] as List<dynamic>)
          .map((e) => DataOfferPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OfferPackageResponseToJson(
        OfferPackageResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
