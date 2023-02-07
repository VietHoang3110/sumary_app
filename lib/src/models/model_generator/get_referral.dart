import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'get_referral.g.dart';



@JsonSerializable()
class GetReferralResponse extends BaseResponse {
  final String data;


  GetReferralResponse(this.data);


  factory GetReferralResponse.fromJson(Map<String, dynamic> json) => _$GetReferralResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetReferralResponseToJson(this);
}

