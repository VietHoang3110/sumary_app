import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'detail_productt.g.dart';

@JsonSerializable()
class ListBookOfAuthor  {
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
  final int? voiceTime;
  final List<DataFile>? file;
  final List<String>? tags;
  final int? amount;
  final  bool? available;
  final int? viewCount;
  final int? soldCount;
  final bool? isActivated;
  final String? createdAt;
  final String? updatedAt;
  final String? slug;
  final bool? isNew;
  @JsonKey(name: "__v")
  final int? v;

  ListBookOfAuthor(this.id , this.name, this.code, this.author, this.category, this.filter, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.avgRate, this.language, this.voice, this.voiceTime, this.file, this.tags, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.isNew, this.v);

  factory ListBookOfAuthor.fromJson(Map<String, dynamic> json) => _$ListBookOfAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookOfAuthorToJson(this);
}

@JsonSerializable()
class ListCategory {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final String? parent;
  final bool? enabled;
  final String? author;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  ListCategory(this.id, this.name, this.description, this.parent, this.enabled, this.author, this.createdAt, this.updatedAt, this.v);

  factory ListCategory.fromJson(Map<String, dynamic> json) => _$ListCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryToJson(this);
}


@JsonSerializable()
class Category {
  @JsonKey(name: "_id")
  final String? id;
  String? name;
  String? description;
  String? parent;
  bool? enabled;
  String? author;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  Category({this.id,
        this.name,
        this.description,
        this.parent,
        this.enabled,
        this.author,
        this.createdAt,
        this.updatedAt,
        this.v});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Author {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;


  Author(this.id, this.name, this.description, this.isDeleted, this.createdAt, this.updatedAt, this.v);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class DataFile {
  final String? name;
  final String? key;
  final String? src;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;


  DataFile(this.name, this.key, this.id, this.createdAt, this.updatedAt, this.src);

  factory DataFile.fromJson(Map<String, dynamic> json) => _$DataFileFromJson(json);

  Map<String, dynamic> toJson() => _$DataFileToJson(this);
}

@JsonSerializable()
class DataVoice {
  final String? name;
  final String? description;
  final String? src;
  final int? index;
  final double? duration;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;


  DataVoice(this.name, this.id, this.createdAt, this.updatedAt, this.description, this.index, this.duration, this.src);

  factory DataVoice.fromJson(Map<String, dynamic> json) => _$DataVoiceFromJson(json);

  Map<String, dynamic> toJson() => _$DataVoiceToJson(this);
}


@JsonSerializable()
class DataDetailProductFull {
  @JsonKey(name: "_id")
  final String? Id;
  final String? name;
  final String? code;
  final Author? author;
  final Category? category;
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
  final int? voiceTime;
  final List<DataFile>? file;
  final List<String>? tags;
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
  final bool? isNew;

  DataDetailProductFull(this.Id, this.name, this.code, this.author, this.category, this.filter, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.avgRate, this.language, this.voice, this.voiceTime, this.file, this.tags, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v, this.isNew);

  factory DataDetailProductFull.fromJson(Map<String, dynamic> json) => _$DataDetailProductFullFromJson(json);

  Map<String, dynamic> toJson() => _$DataDetailProductFullToJson(this);
}


@JsonSerializable()
class DataDetailProduct {
  DataDetailProductFull? book;
  bool is_buy;
  bool is_save;
  @JsonKey(name: "total_done_chapter")
  final int? totalDoneChapter;
  List<ListBookOfAuthor>? listBookOfAuthor;
  List<ListCategory>? listCategory;


  DataDetailProduct(this.book, this.is_buy, this.is_save, this.totalDoneChapter);

  factory DataDetailProduct.fromJson(Map<String, dynamic> json) => _$DataDetailProductFromJson(json);

  Map<String, dynamic> toJson() => _$DataDetailProductToJson(this);
}

@JsonSerializable()
class DetailProductResponse extends BaseResponse{
  DataDetailProduct? data;

  DetailProductResponse(this.data);
  factory DetailProductResponse.fromJson(Map<String, dynamic> json) => _$DetailProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailProductResponseToJson(this);
}