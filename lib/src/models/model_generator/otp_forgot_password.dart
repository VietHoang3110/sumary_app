import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';


part 'otp_forgot_password.g.dart';

@JsonSerializable()
class DataOtpForgot {
  final String token;

  const DataOtpForgot(
      this.token
      );

  factory DataOtpForgot.fromJson(Map<String, dynamic> json) => _$DataOtpForgotFromJson(json);

  Map<String, dynamic> toJson() => _$DataOtpForgotToJson(this);
}

@JsonSerializable()
class OtpForgotResponse extends BaseResponse{
  final DataOtpForgot? data;


  OtpForgotResponse(
      this.data,
      );

  factory OtpForgotResponse.fromJson(Map<String, dynamic> json) => _$OtpForgotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpForgotResponseToJson(this);
}
