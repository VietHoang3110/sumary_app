import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';

part 'filter_product.g.dart';

@JsonSerializable()
class ProductFilter {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? code;
  final String? author;
  final String? category;
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
  final double? avgRate;
  final String? language;
  final List<DataVoice>? voice;
  final List<DataFile>? file;
  final List<String>? tags;
  final int? voiceTime;
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


  ProductFilter(this.id, this.name, this.code, this.author, this.category, this.filter, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.avgRate, this.language, this.voice, this.file, this.tags, this.voiceTime, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v);

  factory ProductFilter.fromJson(Map<String, dynamic> json) => _$ProductFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterToJson(this);
}

@JsonSerializable()
class ProductFilterResponse extends BaseResponse{
  List<ProductFilter>? data;

  ProductFilterResponse(this.data);
  factory ProductFilterResponse.fromJson(Map<String, dynamic> json) => _$ProductFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterResponseToJson(this);
}