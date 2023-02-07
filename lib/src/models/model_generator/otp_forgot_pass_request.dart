import 'package:json_annotation/json_annotation.dart';

import 'index.dart';

part 'otp_forgot_pass_request.g.dart';

@JsonSerializable()
class OtpForgotPasswordRequest {
  final String otp;

  OtpForgotPasswordRequest(this.otp);

  factory OtpForgotPasswordRequest.fromJson(Map<String, dynamic> json) => _$OtpForgotPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OtpForgotPasswordRequestToJson(this);
}