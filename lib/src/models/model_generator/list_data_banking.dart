
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_data_banking.g.dart';


@JsonSerializable()
class DataBanking {
  @JsonKey(name: "_id")
  final String? id;
  final String? bank_name;
  final String? icon_url;
  final String? owner_name;
  final String? bank_account;
  final bool? activate;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  DataBanking(
      this.id,
      this.bank_name,
      this.icon_url,
      this.owner_name,
      this.bank_account,
      this.activate,
      this.createdAt,
      this.updatedAt,
      this.v);


  factory DataBanking.fromJson(Map<String, dynamic> json) => _$DataBankingFromJson(json);

  Map<String, dynamic> toJson() => _$DataBankingToJson(this);
}

@JsonSerializable()
class ListDataBankingResponse extends BaseResponse{
  final List<DataBanking>? data;


  ListDataBankingResponse(this.data) ;

  factory ListDataBankingResponse.fromJson(Map<String, dynamic> json) => _$ListDataBankingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListDataBankingResponseToJson(this);
}