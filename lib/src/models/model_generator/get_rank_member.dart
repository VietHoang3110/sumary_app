
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'get_rank_member.g.dart';


@JsonSerializable()
class DataRankMember {
  final String? name;
  final String? description;
  final int? level;
  final double? bcoin;
  final int? book_for_free;

  DataRankMember(this.name, this.description, this.level, this.bcoin, this.book_for_free);

  factory DataRankMember.fromJson(Map<String, dynamic> json) => _$DataRankMemberFromJson(json);
  Map<String, dynamic> toJson() => _$DataRankMemberToJson(this);
}

@JsonSerializable()
class RankMemberResponse extends BaseResponse{
  final DataRankMember? data;

  RankMemberResponse(this.data) ;

  factory RankMemberResponse.fromJson(Map<String, dynamic> json) => _$RankMemberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RankMemberResponseToJson(this);
}