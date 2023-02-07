// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avg_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRate _$DataRateFromJson(Map<String, dynamic> json) => DataRate(
      (json['avgContentRate'] as num?)?.toDouble(),
      (json['avgVoiceRate'] as num?)?.toDouble(),
      (json['avgRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DataRateToJson(DataRate instance) => <String, dynamic>{
      'avgContentRate': instance.avgContentRate,
      'avgVoiceRate': instance.avgVoiceRate,
      'avgRate': instance.avgRate,
    };

AvgRateResponse _$AvgRateResponseFromJson(Map<String, dynamic> json) =>
    AvgRateResponse(
      json['data'] == null
          ? null
          : DataRate.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AvgRateResponseToJson(AvgRateResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
