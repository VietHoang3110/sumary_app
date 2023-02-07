
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'create_rate_product.g.dart';

@JsonSerializable()
class Book{
  @JsonKey(name: "_id")
  final String? id;

  Book(this.id);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class CreateRate {
  final int voiceStar;
  final int contentStar;
  final String content;
  CreateRate({required this.voiceStar, required this.contentStar, required this.content});
  factory CreateRate.fromJson(Map<String, dynamic> json) => _$CreateRateFromJson(json);
  Map<String, dynamic> toJson() => _$CreateRateToJson(this);
}


@JsonSerializable()
class CreateRateResponse  extends BaseResponse{

  CreateRateResponse? data;

  CreateRateResponse(this.data);

  factory CreateRateResponse.fromJson(Map<String, dynamic> json) => _$CreateRateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRateResponseToJson(this);
}
