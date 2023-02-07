// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_rank_member_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataListRank _$DataListRankFromJson(Map<String, dynamic> json) => DataListRank(
      json['_id'] as String,
      json['name'] as String,
      json['description'] as String,
      (json['bcoin'] as num?)?.toDouble(),
      json['activated'] as bool?,
      json['author'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
      json['editor'] as String?,
      json['book_for_free'] as int?,
      json['level'] as int?,
    );

Map<String, dynamic> _$DataListRankToJson(DataListRank instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'bcoin': instance.bcoin,
      'activated': instance.activated,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'editor': instance.editor,
      'book_for_free': instance.book_for_free,
      'level': instance.level,
    };

ListRankMember _$ListRankMemberFromJson(Map<String, dynamic> json) =>
    ListRankMember(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataListRank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListRankMemberToJson(ListRankMember instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListRankMemberResponse _$ListRankMemberResponseFromJson(
        Map<String, dynamic> json) =>
    ListRankMemberResponse(
      json['data'] == null
          ? null
          : ListRankMember.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListRankMemberResponseToJson(
        ListRankMemberResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
