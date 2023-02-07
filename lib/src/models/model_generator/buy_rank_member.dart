
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'buy_rank_member.g.dart';


@JsonSerializable()
class PostBuyRank {
  final String mid;

  PostBuyRank(this.mid);

  factory PostBuyRank.fromJson(Map<String, dynamic> json) => _$PostBuyRankFromJson(json);
  Map<String, dynamic> toJson() => _$PostBuyRankToJson(this);
}


@JsonSerializable()
class BuyRankMemberResponse  extends BaseResponse{

  bool? data;

  BuyRankMemberResponse(this.data);

  factory BuyRankMemberResponse.fromJson(Map<String, dynamic> json) => _$BuyRankMemberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyRankMemberResponseToJson(this);
}
