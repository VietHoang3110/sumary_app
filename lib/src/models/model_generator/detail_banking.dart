
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'detail_banking.g.dart';

@JsonSerializable()
class Banking{
  @JsonKey(name: "_id")
  final String? id;
  Banking(this.id);

  factory Banking.fromJson(Map<String, dynamic> json) => _$BankingFromJson(json);

  Map<String, dynamic> toJson() => _$BankingToJson(this);
}

@JsonSerializable()
class DetailBanking {
  final String bank_account;
  final String bank_name;
  final String owner_name;
  final String transfer_content;

  DetailBanking(this.bank_account, this.bank_name, this.owner_name, this.transfer_content);

  factory DetailBanking.fromJson(Map<String, dynamic> json) => _$DetailBankingFromJson(json);
  Map<String, dynamic> toJson() => _$DetailBankingToJson(this);
}


@JsonSerializable()
class DetailBankingResponse  extends BaseResponse{

  DetailBanking? data;

  DetailBankingResponse(this.data);

  factory DetailBankingResponse.fromJson(Map<String, dynamic> json) => _$DetailBankingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailBankingResponseToJson(this);
}
