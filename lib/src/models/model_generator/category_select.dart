import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'category_select.g.dart';

@JsonSerializable()
class CategoryFilter {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;


  CategoryFilter(this.id, this.name,
      this.description, this.createdAt,
      this.updatedAt, this.v
      );

  factory CategoryFilter.fromJson(Map<String, dynamic> json) => _$CategoryFilterFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryFilterToJson(this);
}

@JsonSerializable()
class CategoryFilterResponse extends BaseResponse{
  List<CategoryFilter>? data;

  CategoryFilterResponse(this.data);
  factory CategoryFilterResponse.fromJson(Map<String, dynamic> json) => _$CategoryFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryFilterResponseToJson(this);
}