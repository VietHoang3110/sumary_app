import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'search_popular.g.dart';

@JsonSerializable()
class RecordsDataPopular{
  @JsonKey(name: "_id")
  final String? id;
  final String? keyword;
  final String? createdAt,updatedAt;
  final int? count;
  @JsonKey(name: "__v")
  final int? v;


  RecordsDataPopular(
      this.id, this.keyword, this.createdAt,
      this.updatedAt, this.count, this.v);

  factory RecordsDataPopular.fromJson(Map<String, dynamic> json) => _$RecordsDataPopularFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsDataPopularToJson(this);
}

@JsonSerializable()
class DataSearchPopular{
  final List<RecordsDataPopular>? records;
  final int? total,currentPage,pageSize;


  DataSearchPopular(this.records, this.total,
      this.currentPage, this.pageSize, );

  factory DataSearchPopular.fromJson(Map<String, dynamic> json) => _$DataSearchPopularFromJson(json);

  Map<String, dynamic> toJson() => _$DataSearchPopularToJson(this);
}

@JsonSerializable()
class SearchPopularResponse extends BaseResponse{
  final DataSearchPopular? data;

  SearchPopularResponse(this.data, );

  factory SearchPopularResponse.fromJson(Map<String, dynamic> json) => _$SearchPopularResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPopularResponseToJson(this);
}


