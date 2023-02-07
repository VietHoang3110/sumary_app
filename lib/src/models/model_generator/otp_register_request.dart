import 'package:json_annotation/json_annotation.dart';

import 'index.dart';

part 'otp_register_request.g.dart';

@JsonSerializable()
class OtpRegisterRequest {
  final String otp;

  OtpRegisterRequest(this.otp);

  factory OtpRegisterRequest.fromJson(Map<String, dynamic> json) => _$OtpRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OtpRegisterRequestToJson(this);
}