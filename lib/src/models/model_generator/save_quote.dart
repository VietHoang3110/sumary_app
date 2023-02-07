
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'save_quote.g.dart';

@JsonSerializable()
class QuoteSave{
  @JsonKey(name: "_id")
  final String? id;

  QuoteSave(this.id);

  factory QuoteSave.fromJson(Map<String, dynamic> json) => _$QuoteSaveFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteSaveToJson(this);
}

@JsonSerializable()
class SaveQuoteResponse  extends BaseResponse{

  SaveQuoteResponse? data;

  SaveQuoteResponse(this.data);

  factory SaveQuoteResponse.fromJson(Map<String, dynamic> json) => _$SaveQuoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveQuoteResponseToJson(this);
}
