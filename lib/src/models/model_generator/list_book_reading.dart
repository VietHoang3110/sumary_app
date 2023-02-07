import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_book_reading.g.dart';



@JsonSerializable()
class VoiceBookReading {
  final String? name;
  final String? src;
  final int? index;
  final String? description;
  final double? duration;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  VoiceBookReading(this.name, this.src, this.index, this.description, this.duration, this.id, this.createdAt, this.updatedAt);

  factory VoiceBookReading.fromJson(Map<String, dynamic> json) => _$VoiceBookReadingFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceBookReadingToJson(this);
}

@JsonSerializable()
class FileBookReading {
  final String? name;
  final String? src;
  final String? key;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  FileBookReading(this.name, this.src, this.key, this.id, this.createdAt, this.updatedAt);

  factory FileBookReading.fromJson(Map<String, dynamic> json) => _$FileBookReadingFromJson(json);

  Map<String, dynamic> toJson() => _$FileBookReadingToJson(this);
}

@JsonSerializable()
class ProductReadingData {
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
  final List<VoiceBookReading>? voice;
  final List<FileBookReading>? file;
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



  ProductReadingData(this.id, this.name, this.author, this.category, this.filter, this.mood, this.reason, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.voice, this.file, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v);

  factory ProductReadingData.fromJson(Map<String, dynamic> json) => _$ProductReadingDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReadingDataToJson(this);
}

@JsonSerializable()
class DataProductReading {
  @JsonKey(name: "_id")
  final String? id;
  final String? user;
  final ProductReadingData? product;
  @JsonKey(name: "__v")
  final int? v;

  DataProductReading(
      this.id,
      this.v, this.user, this.product,
      );

  factory DataProductReading.fromJson(Map<String, dynamic> json) => _$DataProductReadingFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductReadingToJson(this);
}


@JsonSerializable()
class ListBookReadingResponse extends BaseResponse {
  final List<DataProductReading> data;


  ListBookReadingResponse(this.data);


  factory ListBookReadingResponse.fromJson(Map<String, dynamic> json) => _$ListBookReadingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookReadingResponseToJson(this);
}

