
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'content_terms.g.dart';




@JsonSerializable()
class DataTerms {
  final String? title;
  final String? content;

  DataTerms(this.title, this.content);

  factory DataTerms.fromJson(Map<String, dynamic> json) => _$DataTermsFromJson(json);
  Map<String, dynamic> toJson() => _$DataTermsToJson(this);
}

@JsonSerializable()
class ContentTermsResponse extends BaseResponse{
  final DataTerms? data;

  ContentTermsResponse(this.data) ;

  factory ContentTermsResponse.fromJson(Map<String, dynamic> json) => _$ContentTermsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContentTermsResponseToJson(this);
}