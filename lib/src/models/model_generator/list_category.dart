
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_category.g.dart';

@JsonSerializable()
class DataChildCategory {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final String? parent;
  final bool? enabled;
  final String? author;
  final String? createdAt;
  final String? updatedAt;
  // final String? lastEditor;
  // final int? order;
  @JsonKey(name: "__v")
  final int? v;


  DataChildCategory(this.id, this.name, this.description, this.parent, this.enabled, this.author, this.createdAt, this.updatedAt, this.v);


  factory DataChildCategory.fromJson(Map<String, dynamic> json) => _$DataChildCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DataChildCategoryToJson(this);
}

@JsonSerializable()
class DataCategory {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final String? parent;
  final bool? enabled;
  final String? author;
  final String? createdAt;
  final String? updatedAt;
  final String? lastEditor;
  final int? order;
  final int row;
  @JsonKey(name: "__v")
  final int? v;
  final List<DataChildCategory>? childs;


  DataCategory(this.id, this.name, this.description, this.parent, this.enabled, this.author, this.createdAt, this.updatedAt, this.lastEditor, this.order, this.row, this.v, this.childs);


  factory DataCategory.fromJson(Map<String, dynamic> json) => _$DataCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoryToJson(this);
}


@JsonSerializable()
class ListCategory {
  final int? total;
  final List<List<DataCategory>>? records;
  final int? currentPage;
  final int? pageSize;


  ListCategory(this.total, this.records, this.currentPage, this.pageSize);

  factory ListCategory.fromJson(Map<String, dynamic> json) => _$ListCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryToJson(this);
}

@JsonSerializable()
class ListCategoryResponse extends BaseResponse{
  final ListCategory? data;


  ListCategoryResponse(this.data) ;

  factory ListCategoryResponse.fromJson(Map<String, dynamic> json) => _$ListCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryResponseToJson(this);
}