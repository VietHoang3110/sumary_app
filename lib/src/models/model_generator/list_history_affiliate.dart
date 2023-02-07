
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_history_affiliate.g.dart';


@JsonSerializable()
class dataUser {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  dataUser(this.id, this.name);

  factory dataUser.fromJson(Map<String, dynamic> json) => _$dataUserFromJson(json);

  Map<String, dynamic> toJson() => _$dataUserToJson(this);
}


@JsonSerializable()
class DataHistoryAffiliate {
  @JsonKey(name: "_id")
  final String? id;
  final String? recharge_code;
  final dataUser? user;
  final dataUser? userCharged;
  final double? bcoin;
  final String? note;
  final String? create_at;

  DataHistoryAffiliate(this.id, this.recharge_code, this.user, this.userCharged,  this.bcoin, this.note, this.create_at);

  factory DataHistoryAffiliate.fromJson(Map<String, dynamic> json) => _$DataHistoryAffiliateFromJson(json);

  Map<String, dynamic> toJson() => _$DataHistoryAffiliateToJson(this);
}

@JsonSerializable()
class ListHistoryAffiliate {
  final int? total,currentPage,pageSize;
  final List<DataHistoryAffiliate>? records;


  ListHistoryAffiliate(this.total, this.currentPage, this.pageSize, this.records);

  factory ListHistoryAffiliate.fromJson(Map<String, dynamic> json) => _$ListHistoryAffiliateFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryAffiliateToJson(this);
}

@JsonSerializable()
class ListHistoryAffiliateResponse extends BaseResponse{
  final ListHistoryAffiliate? data;

  ListHistoryAffiliateResponse(this.data);

  factory ListHistoryAffiliateResponse.fromJson(Map<String, dynamic> json) => _$ListHistoryAffiliateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryAffiliateResponseToJson(this);
}