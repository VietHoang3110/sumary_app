// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rank_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRankMember _$DataRankMemberFromJson(Map<String, dynamic> json) =>
    DataRankMember(
      json['name'] as String?,
      json['description'] as String?,
      json['level'] as int?,
      (json['bcoin'] as num?)?.toDouble(),
      json['book_for_free'] as int?,
    );

Map<String, dynamic> _$DataRankMemberToJson(DataRankMember instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'level': instance.level,
      'bcoin': instance.bcoin,
      'book_for_free': instance.book_for_free,
    };

RankMemberResponse _$RankMemberResponseFromJson(Map<String, dynamic> json) =>
    RankMemberResponse(
      json['data'] == null
          ? null
          : DataRankMember.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RankMemberResponseToJson(RankMemberResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
