
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_history_recharge.g.dart';



@JsonSerializable()
class DataHistoryRecharge {
  @JsonKey(name: "_id")
  final String? id;
  final String? recharge_code;
  final double? bcoin;
  final int? amount;
  final String? method;
  final String? create_at;
  final String? create_by;
  final bool? is_deleted;

  DataHistoryRecharge(this.id, this.recharge_code, this.bcoin, this.amount, this.method, this.create_at, this.create_by, this.is_deleted);

  factory DataHistoryRecharge.fromJson(Map<String, dynamic> json) => _$DataHistoryRechargeFromJson(json);

  Map<String, dynamic> toJson() => _$DataHistoryRechargeToJson(this);
}

@JsonSerializable()
class ListHistoryRecharge {
  final int? total,currentPage,pageSize;
  final List<DataHistoryRecharge>? records;


  ListHistoryRecharge(this.total, this.currentPage, this.pageSize, this.records);

  factory ListHistoryRecharge.fromJson(Map<String, dynamic> json) => _$ListHistoryRechargeFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryRechargeToJson(this);
}

@JsonSerializable()
class ListHistoryRechargeResponse extends BaseResponse{
  final ListHistoryRecharge? data;

  ListHistoryRechargeResponse(this.data);

  factory ListHistoryRechargeResponse.fromJson(Map<String, dynamic> json) => _$ListHistoryRechargeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryRechargeResponseToJson(this);
}