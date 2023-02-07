import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_ask.g.dart';



@JsonSerializable()
class DataAks {
  @JsonKey(name: "_id")
  final String id;
  final String user;
  final String product;
  final String? name;
  final String? question;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  final String? answer;
  final String? answerer;


  DataAks(this.id, this.user, this.product, this.name, this.question, this.createdAt, this.updatedAt, this.v, this.answer, this.answerer
      );

  factory DataAks.fromJson(Map<String, dynamic> json) => _$DataAksFromJson(json);

  Map<String, dynamic> toJson() => _$DataAksToJson(this);
}

@JsonSerializable()
class ListAsk {
  final int? total,currentPage,pageSize;
  final List<DataAks> records;


  ListAsk(this.total, this.currentPage, this.pageSize, this.records);

  factory ListAsk.fromJson(Map<String, dynamic> json) => _$ListAskFromJson(json);

  Map<String, dynamic> toJson() => _$ListAskToJson(this);
}


@JsonSerializable()
class ListAskResponse extends BaseResponse {
  final ListAsk data;


  ListAskResponse(this.data);


  factory ListAskResponse.fromJson(Map<String, dynamic> json) => _$ListAskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListAskResponseToJson(this);
}

