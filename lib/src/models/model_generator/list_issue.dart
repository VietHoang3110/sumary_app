
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_issue.g.dart';


@JsonSerializable()
class DataIssue {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "__v")
  final int? v;
  final String? name,author,createdAt,updatedAt;
  DataIssue({this.id,this.name, this.author, this.createdAt,this.v,
    this.updatedAt});


  factory DataIssue.fromJson(Map<String, dynamic> json) => _$DataIssueFromJson(json);

  Map<String, dynamic> toJson() => _$DataIssueToJson(this);
}


@JsonSerializable()
class ListIssue {
  final int? total;
  final List<DataIssue>? records;
  final int? currentPage;
  final int? pageSize;

  ListIssue(this.total, this.records, this.pageSize, this.currentPage);

  factory ListIssue.fromJson(Map<String, dynamic> json) => _$ListIssueFromJson(json);
  Map<String, dynamic> toJson() => _$ListIssueToJson(this);
}

@JsonSerializable()
class ListIssueResponse extends BaseResponse{
  final ListIssue? data;


  ListIssueResponse(this.data) ;

  factory ListIssueResponse.fromJson(Map<String, dynamic> json) => _$ListIssueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListIssueResponseToJson(this);
}