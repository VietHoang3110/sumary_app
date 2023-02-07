import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_book_saved.g.dart';


@JsonSerializable()
class FileBook {
  final String? name;
  final String? src;
  final String? key;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  FileBook(this.name, this.src, this.key, this.id, this.createdAt, this.updatedAt
      );

  factory FileBook.fromJson(Map<String, dynamic> json) => _$FileBookFromJson(json);

  Map<String, dynamic> toJson() => _$FileBookToJson(this);
}


@JsonSerializable()
class VoiceBook {
  final String? name;
  final String? src;
  final int? index;
  final String? description;
  final double? duration;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  VoiceBook(this.name, this.src, this.index, this.description, this.duration, this.id, this.createdAt, this.updatedAt
      );

  factory VoiceBook.fromJson(Map<String, dynamic> json) => _$VoiceBookFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceBookToJson(this);
}

@JsonSerializable()
class ProductSavedData {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? author;
  final String? category;
  final String? mood;
  final String? reason;
  final String? translator;
  final int? publishingYear;
  final String? type;
  final int? numberOfPage;
  final String? description;
  final String? image;
  final List<String> images;
  final int? prePrice;
  final int? price;
  final double? avgVoiceRate;
  final double? avgContentRate;
  final String? language;
  final List<VoiceBook>? voice;
  final List<FileBook>? file;
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

  ProductSavedData(this.id, this.name, this.author, this.category, this.mood, this.reason, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.language, this.voice, this.file, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v);

  factory ProductSavedData.fromJson(Map<String, dynamic> json) => _$ProductSavedDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSavedDataToJson(this);
}

@JsonSerializable()
class DataProductSaved {
  @JsonKey(name: "_id")
  final String? id;
  final String? user;
  final ProductSavedData? product;
  final String? createdAt;
  final String? updatedAt;

  @JsonKey(name: "__v")
  final int? v;

  DataProductSaved(
      this.id,
      this.v, this.user, this.product,
      this.createdAt, this.updatedAt
      );

  factory DataProductSaved.fromJson(Map<String, dynamic> json) => _$DataProductSavedFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductSavedToJson(this);
}

@JsonSerializable()
class ListProductSaved {
  final int? total,currentPage,pageSize;
  final List<DataProductSaved>? records;


  ListProductSaved(this.total, this.currentPage, this.pageSize, this.records);

  factory ListProductSaved.fromJson(Map<String, dynamic> json) => _$ListProductSavedFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductSavedToJson(this);
}
@JsonSerializable()
class ListBookSavedResponse extends BaseResponse {
  final ListProductSaved? data;


  ListBookSavedResponse(this.data);


  factory ListBookSavedResponse.fromJson(Map<String, dynamic> json) => _$ListBookSavedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookSavedResponseToJson(this);
}

