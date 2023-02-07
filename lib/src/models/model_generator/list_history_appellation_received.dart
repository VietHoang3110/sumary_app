
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_history_appellation_received.g.dart';



@JsonSerializable()
class DataHistoryAppellation {
  @JsonKey(name: "_id")
  final String? id;
  final String? trans_code;
  final double? bcoin_received;
  final int? read_books;
  final String? note;
  final String? create_at;

  DataHistoryAppellation(this.id, this.trans_code, this.bcoin_received, this.read_books, this.note, this.create_at);

  factory DataHistoryAppellation.fromJson(Map<String, dynamic> json) => _$DataHistoryAppellationFromJson(json);

  Map<String, dynamic> toJson() => _$DataHistoryAppellationToJson(this);
}

@JsonSerializable()
class ListHistoryAppellation {
  final int? total,currentPage,pageSize;
  final List<DataHistoryAppellation>? records;


  ListHistoryAppellation(this.total, this.currentPage, this.pageSize, this.records);

  factory ListHistoryAppellation.fromJson(Map<String, dynamic> json) => _$ListHistoryAppellationFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryAppellationToJson(this);
}

@JsonSerializable()
class ListHistoryAppellationResponse extends BaseResponse{
  final ListHistoryAppellation? data;

  ListHistoryAppellationResponse(this.data);

  factory ListHistoryAppellationResponse.fromJson(Map<String, dynamic> json) => _$ListHistoryAppellationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryAppellationResponseToJson(this);
}