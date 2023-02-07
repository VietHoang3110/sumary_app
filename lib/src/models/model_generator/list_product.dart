import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';

part 'list_product.g.dart';

@JsonSerializable()
class Author {
  @JsonKey(name: "_id")
  final String? id;
  final String? name,description,createdAt,updatedAt;
  final bool? isDeleted;
  @JsonKey(name: "__v")
  final int? v;


  Author(this.id, this.name, this.description, this.createdAt, this.updatedAt,
      this.isDeleted, this.v);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class DataCate {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;

  DataCate(this.id, this.name);

  factory DataCate.fromJson(Map<String, dynamic> json) => _$DataCateFromJson(json);

  Map<String, dynamic> toJson() => _$DataCateToJson(this);
}


@JsonSerializable()
class DataProduct {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final Author? author;
  final DataCate? category;
  final List<String>? filter;
  final String? mood;
  final String? reason;
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
  final String? code;
  final int? voiceTime;


  DataProduct(this.id, this.name, this.author, this.category, this.filter, this.mood, this.reason, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.voice, this.file, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v, this.code, this.voiceTime);

  factory DataProduct.fromJson(Map<String, dynamic> json) => _$DataProductFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductToJson(this);
}
@JsonSerializable()
class ListProduct {
  final int? total,currentPage,pageSize;
  final List<DataProduct> records;


  ListProduct(this.total, this.currentPage, this.pageSize, this.records);

  factory ListProduct.fromJson(Map<String, dynamic> json) => _$ListProductFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductToJson(this);
}
@JsonSerializable()
class ListProductResponse extends BaseResponse {
  final ListProduct? data;


  ListProductResponse(this.data);


  factory ListProductResponse.fromJson(Map<String, dynamic> json) => _$ListProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductResponseToJson(this);
}

