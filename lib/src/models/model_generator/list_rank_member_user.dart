import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_rank_member_user.g.dart';



@JsonSerializable()
class DataListRank {
  @JsonKey(name: "_id")
  final String id;
  final String name;
  final String description;
  final double? bcoin;
  final bool? activated;
  final String? author;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  final String? editor;
  final int? book_for_free;
  final int? level;


  DataListRank(this.id, this.name, this.description, this.bcoin, this.activated, this.author, this.createdAt, this.updatedAt, this.v, this.editor, this.book_for_free, this.level);

  factory DataListRank.fromJson(Map<String, dynamic> json) => _$DataListRankFromJson(json);

  Map<String, dynamic> toJson() => _$DataListRankToJson(this);
}

@JsonSerializable()
class ListRankMember {
  final int? total,currentPage,pageSize;
  final List<DataListRank>? records;


  ListRankMember(this.total, this.currentPage, this.pageSize, this.records);

  factory ListRankMember.fromJson(Map<String, dynamic> json) => _$ListRankMemberFromJson(json);

  Map<String, dynamic> toJson() => _$ListRankMemberToJson(this);
}


@JsonSerializable()
class ListRankMemberResponse extends BaseResponse {
  final ListRankMember? data;


  ListRankMemberResponse(this.data);


  factory ListRankMemberResponse.fromJson(Map<String, dynamic> json) => _$ListRankMemberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListRankMemberResponseToJson(this);
}

