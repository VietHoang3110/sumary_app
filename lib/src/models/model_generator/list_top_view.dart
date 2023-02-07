import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_top_view.g.dart';

@JsonSerializable()
class VoiceTopView {
  final String? name;
  final String? src;
  final int? index;
  final String? description;
  final double? duration;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;


  VoiceTopView(this.name, this.src, this.index, this.description, this.duration, this.id, this.createdAt, this.updatedAt);
  factory VoiceTopView.fromJson(Map<String, dynamic> json) => _$VoiceTopViewFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceTopViewToJson(this);
}

@JsonSerializable()
class FileTopView {
  final String? name;
  final String? src;
  final String? key;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;


  FileTopView(this.name, this.src, this.key, this.id, this.createdAt, this.updatedAt);
  factory FileTopView.fromJson(Map<String, dynamic> json) => _$FileTopViewFromJson(json);
  Map<String, dynamic> toJson() => _$FileTopViewToJson(this);
}


@JsonSerializable()
class ListTopView {
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
  final List<VoiceTopView>? voice;
  final List<FileTopView>? file;
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

  ListTopView(this.id, this.name, this.author, this.category, this.filter, this.mood, this.reason, this.translator, this.publishingYear, this.type, this.numberOfPage, this.description, this.image, this.images, this.prePrice, this.price, this.avgVoiceRate, this.avgContentRate, this.language, this.voice, this.file, this.amount, this.available, this.viewCount, this.soldCount, this.isActivated, this.createdAt, this.updatedAt, this.slug, this.v);
  factory ListTopView.fromJson(Map<String, dynamic> json) => _$ListTopViewFromJson(json);
  Map<String, dynamic> toJson() => _$ListTopViewToJson(this);
}


@JsonSerializable()
class ListTopViewResponse extends BaseResponse {
  final List<ListTopView> data;


  ListTopViewResponse(this.data);


  factory ListTopViewResponse.fromJson(Map<String, dynamic> json) => _$ListTopViewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListTopViewResponseToJson(this);
}

