import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_book_same.g.dart';


@JsonSerializable()
class FileBook {
  final String? name;
  final String? key;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  FileBook(this.name, this.key, this.id, this.createdAt, this.updatedAt);

  factory FileBook.fromJson(Map<String, dynamic> json) => _$FileBookFromJson(json);

  Map<String, dynamic> toJson() => _$FileBookToJson(this);
}


@JsonSerializable()
class VoiceBook {
  final String? name;
  final int? index;
  final String? description;
  final double? duration;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  VoiceBook(this.name, this.index, this.description, this.duration, this.id, this.createdAt, this.updatedAt);

  factory VoiceBook.fromJson(Map<String, dynamic> json) => _$VoiceBookFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceBookToJson(this);
}

@JsonSerializable()
class DataAuthor {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name:"__v")
  final int? v;

  DataAuthor(this.id, this.name, this.description, this.isDeleted, this.createdAt, this.updatedAt, this.v);

  factory DataAuthor.fromJson(Map<String, dynamic> json) => _$DataAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$DataAuthorToJson(this);
}


@JsonSerializable()
class DataProductSame {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final DataAuthor? author;
  final String? category;
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

  DataProductSame(this.id, this.name, this.author, this.category, this.filter, this.mood, this.reason, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.language, this.voice, this.file, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v);

  factory DataProductSame.fromJson(Map<String, dynamic> json) => _$DataProductSameFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductSameToJson(this);
}

@JsonSerializable()
class ListProductSame {
  final int? total,currentPage,pageSize;
  final List<DataProductSame>? records;


  ListProductSame(this.total, this.currentPage, this.pageSize, this.records);

  factory ListProductSame.fromJson(Map<String, dynamic> json) => _$ListProductSameFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductSameToJson(this);
}


@JsonSerializable()
class ListBookSameResponse extends BaseResponse {
  final ListProductSame? data;


  ListBookSameResponse(this.data);


  factory ListBookSameResponse.fromJson(Map<String, dynamic> json) => _$ListBookSameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookSameResponseToJson(this);
}

