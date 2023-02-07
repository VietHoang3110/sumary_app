
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'like_quote.g.dart';

@JsonSerializable()
class QuoteLike{
  @JsonKey(name: "_id")
  final String? id;

  QuoteLike(this.id);

  factory QuoteLike.fromJson(Map<String, dynamic> json) => _$QuoteLikeFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteLikeToJson(this);
}

@JsonSerializable()
class LikeQuoteResponse  extends BaseResponse{

  LikeQuoteResponse? data;

  LikeQuoteResponse(this.data);

  factory LikeQuoteResponse.fromJson(Map<String, dynamic> json) => _$LikeQuoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LikeQuoteResponseToJson(this);
}
