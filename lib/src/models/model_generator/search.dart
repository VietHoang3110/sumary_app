import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';
import 'package:sumary_app/src/models/model_generator/list_product.dart';

part 'search.g.dart';

@JsonSerializable()
class Author{
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  final bool isDeleted;

  Author(this.id, this.name, this.description,
      this.createdAt, this.updatedAt,
      this.v, this.isDeleted);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class RecordsData{
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final Author? author;
  final DataCate? category;
  final List<String>? filter;
  final String? translator;
  final int? publishingYear;
  final String? type;
  final int? numberOfPage;
  final String? description;
  final String? image;
  final List<String>? images;
  final int? prePrice;
  final int? price;
  final double? avgVoiceRate;
  final double? avgContentRate;
  final String? language;
  final List<DataVoice>? voice;
  final List<DataFile>? file;
  final int? amount;
  final bool? available;
  final int? viewCount;
  final int? soldCount;
  final bool? isActivated;
  final String? createdAt;
  final String? updatedAt;
  final String? slug;
  @JsonKey(name: "__v")
  final int? v;


  RecordsData(this.id, this.name, this.author, this.category, this.filter, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.language, this.voice, this.file, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v);

  factory RecordsData.fromJson(Map<String, dynamic> json) => _$RecordsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsDataToJson(this);
}

@JsonSerializable()
class DataSearch{
  final List<RecordsData>? records;
  final int? total,currentPage,pageSize;


  DataSearch(this.records, this.total,
      this.currentPage, this.pageSize, );

  factory DataSearch.fromJson(Map<String, dynamic> json) => _$DataSearchFromJson(json);

  Map<String, dynamic> toJson() => _$DataSearchToJson(this);
}

@JsonSerializable()
class SearchResponse extends BaseResponse{
  final DataSearch? data;

  SearchResponse(this.data);

  factory SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}


