import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';
import 'package:sumary_app/src/models/model_generator/list_book_same.dart';

part 'list_book_done.g.dart';

@JsonSerializable()
class DataProductDone {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? author;
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
  final double? avgRate;
  final List<String>? tags;
  @JsonKey(name: "__v")
  final int? v;

  DataProductDone(this.id, this.name, this.author, this.category, this.filter, this.mood, this.reason, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.language, this.voice, this.file, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.avgRate, this.tags, this.v);

  factory DataProductDone.fromJson(Map<String, dynamic> json) => _$DataProductDoneFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductDoneToJson(this);
}

@JsonSerializable()
class ListProductDone {
  @JsonKey(name: "_id")
  final String? id;
  final String? user;
  final int? doneChapter;
  final DataProductDone? product;
  @JsonKey(name: "__v")
  final int? v;
  final bool? isDone;

  ListProductDone(this.id, this.user, this.doneChapter, this.product, this.v, this.isDone);

  factory ListProductDone.fromJson(Map<String, dynamic> json) => _$ListProductDoneFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductDoneToJson(this);
}


@JsonSerializable()
class ListBookDoneResponse extends BaseResponse {
  final List<ListProductDone> data;


  ListBookDoneResponse(this.data);


  factory ListBookDoneResponse.fromJson(Map<String, dynamic> json) => _$ListBookDoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookDoneResponseToJson(this);
}

