// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_history_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAut _$DataAutFromJson(Map<String, dynamic> json) => DataAut(
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['isDeleted'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DataAutToJson(DataAut instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

DataHistoryWallet _$DataHistoryWalletFromJson(Map<String, dynamic> json) =>
    DataHistoryWallet(
      json['_id'] as String?,
      json['order_code'] as String?,
      (json['bcoin'] as num?)?.toDouble(),
      json['is_deleted'] as bool?,
      json['create_at'] as String?,
      json['name'] as String?,
      json['image'] as String?,
      json['author'] == null
          ? null
          : DataAut.fromJson(json['author'] as Map<String, dynamic>),
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataHistoryWalletToJson(DataHistoryWallet instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'order_code': instance.order_code,
      'bcoin': instance.bcoin,
      'is_deleted': instance.is_deleted,
      'create_at': instance.create_at,
      'name': instance.name,
      'image': instance.image,
      'images': instance.images,
      'author': instance.author,
    };

ListHistoryWallet _$ListHistoryWalletFromJson(Map<String, dynamic> json) =>
    ListHistoryWallet(
      json['total'] as int?,
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      (json['records'] as List<dynamic>?)
          ?.map((e) => DataHistoryWallet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHistoryWalletToJson(ListHistoryWallet instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'records': instance.records,
    };

ListHistoryWalletResponse _$ListHistoryWalletResponseFromJson(
        Map<String, dynamic> json) =>
    ListHistoryWalletResponse(
      json['data'] == null
          ? null
          : ListHistoryWallet.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ListHistoryWalletResponseToJson(
        ListHistoryWalletResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
