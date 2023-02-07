import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_quote.g.dart';



@JsonSerializable()
class SlidesData {
  final String? image;
  final String? text;
  @JsonKey(name: "_id")
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  SlidesData(this.image, this.text, this.id, this.createdAt, this.updatedAt);

  factory SlidesData.fromJson(Map<String, dynamic> json) => _$SlidesDataFromJson(json);

  Map<String, dynamic> toJson() => _$SlidesDataToJson(this);
}

@JsonSerializable()
class DataQuote {
  @JsonKey(name: "_id")
  String? id;
  String? product;
  String? url;
  List<String>? lover;
  List<String>? saved;
  bool? isActivated;
  List<SlidesData>? slides;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  bool? isLoved;
  bool? isSaved;

  DataQuote({
        this.id,
        this.product,
        this.url,
        this.lover,
        this.saved,
        this.isActivated,
        this.slides,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.isLoved,
        this.isSaved
      });

  factory DataQuote.fromJson(Map<String, dynamic> json) => _$DataQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$DataQuoteToJson(this);
}


@JsonSerializable()
class ListQuoteResponse extends BaseResponse {
  final List<DataQuote>? data;


  ListQuoteResponse(this.data);


  factory ListQuoteResponse.fromJson(Map<String, dynamic> json) => _$ListQuoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListQuoteResponseToJson(this);
}

