// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_rank_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostBuyRank _$PostBuyRankFromJson(Map<String, dynamic> json) => PostBuyRank(
      json['mid'] as String,
    );

Map<String, dynamic> _$PostBuyRankToJson(PostBuyRank instance) =>
    <String, dynamic>{
      'mid': instance.mid,
    };

BuyRankMemberResponse _$BuyRankMemberResponseFromJson(
        Map<String, dynamic> json) =>
    BuyRankMemberResponse(
      json['data'] as bool?,
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BuyRankMemberResponseToJson(
        BuyRankMemberResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
