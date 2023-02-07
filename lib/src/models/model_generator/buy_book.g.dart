// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookBuy _$BookBuyFromJson(Map<String, dynamic> json) => BookBuy(
      json['_id'] as String?,
    );

Map<String, dynamic> _$BookBuyToJson(BookBuy instance) => <String, dynamic>{
      '_id': instance.id,
    };

PostBuyBook _$PostBuyBookFromJson(Map<String, dynamic> json) => PostBuyBook(
      json['payment_type'] as String,
    );

Map<String, dynamic> _$PostBuyBookToJson(PostBuyBook instance) =>
    <String, dynamic>{
      'payment_type': instance.payment_type,
    };

BuyBookResponse _$BuyBookResponseFromJson(Map<String, dynamic> json) =>
    BuyBookResponse(
      json['data'] == null
          ? null
          : BuyBookResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BuyBookResponseToJson(BuyBookResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
