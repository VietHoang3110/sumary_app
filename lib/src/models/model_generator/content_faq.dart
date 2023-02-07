
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'content_faq.g.dart';

@JsonSerializable()
class ListFAQ {

  final String q;
  final String a;

  ListFAQ(this.q, this.a);

  factory ListFAQ.fromJson(Map<String, dynamic> json) => _$ListFAQFromJson(json);
  Map<String, dynamic> toJson() => _$ListFAQToJson(this);
}

@JsonSerializable()
class DataContentFAQ {

  final List<ListFAQ> data;

  DataContentFAQ(this.data);

  factory DataContentFAQ.fromJson(Map<String, dynamic> json) => _$DataContentFAQFromJson(json);
  Map<String, dynamic> toJson() => _$DataContentFAQToJson(this);
}


@JsonSerializable()
class DataFAQ {
  final String? title;
  final DataContentFAQ content;

  DataFAQ(this.title, this.content);

  factory DataFAQ.fromJson(Map<String, dynamic> json) => _$DataFAQFromJson(json);
  Map<String, dynamic> toJson() => _$DataFAQToJson(this);
}

@JsonSerializable()
class ContentFAQResponse extends BaseResponse{
  final DataFAQ? data;

  ContentFAQResponse(this.data) ;

  factory ContentFAQResponse.fromJson(Map<String, dynamic> json) => _$ContentFAQResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContentFAQResponseToJson(this);
}