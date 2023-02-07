
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_history_advise.g.dart';


@JsonSerializable()
class IssueType {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  IssueType(this.id, this.name);

  factory IssueType.fromJson(Map<String, dynamic> json) => _$IssueTypeFromJson(json);

  Map<String, dynamic> toJson() => _$IssueTypeToJson(this);
}


@JsonSerializable()
class DataHistoryAdvise {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? advisory;
  final IssueType? issueType;
  final String? appointmentDate;
  final String? phoneNumber;
  final String? email;
  final String? content;
  final String? note;
  final String? status;
  final int? bcoin;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  final String? appointmentDateStr;

  DataHistoryAdvise(this.id, this.name, this.advisory, this.issueType, this.appointmentDate, this.phoneNumber, this.email, this.content, this.note, this.status, this.bcoin, this.isDeleted, this.createdAt, this.updatedAt, this.v, this.appointmentDateStr);

  factory DataHistoryAdvise.fromJson(Map<String, dynamic> json) => _$DataHistoryAdviseFromJson(json);

  Map<String, dynamic> toJson() => _$DataHistoryAdviseToJson(this);
}

@JsonSerializable()
class ListHistoryAdvise {
  final int? total,currentPage,pageSize;
  final List<DataHistoryAdvise>? records;


  ListHistoryAdvise(this.total, this.currentPage, this.pageSize, this.records);

  factory ListHistoryAdvise.fromJson(Map<String, dynamic> json) => _$ListHistoryAdviseFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryAdviseToJson(this);
}

@JsonSerializable()
class ListHistoryAdviseResponse extends BaseResponse{
  final ListHistoryAdvise? data;

  ListHistoryAdviseResponse(this.data);

  factory ListHistoryAdviseResponse.fromJson(Map<String, dynamic> json) => _$ListHistoryAdviseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryAdviseResponseToJson(this);
}