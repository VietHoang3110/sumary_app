import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'avg_rate.g.dart';

@JsonSerializable()
class DataRate {
  final double? avgContentRate;
  final double? avgVoiceRate;
  final double? avgRate;


  DataRate(this.avgContentRate, this.avgVoiceRate, this.avgRate);

  factory DataRate.fromJson(Map<String, dynamic> json) => _$DataRateFromJson(json);

  Map<String, dynamic> toJson() => _$DataRateToJson(this);
}

@JsonSerializable()
class AvgRateResponse extends BaseResponse{
  DataRate? data;

  AvgRateResponse(this.data);
  factory AvgRateResponse.fromJson(Map<String, dynamic> json) => _$AvgRateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvgRateResponseToJson(this);
}