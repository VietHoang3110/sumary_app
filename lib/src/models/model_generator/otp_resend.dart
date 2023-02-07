import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'otp_resend.g.dart';


@JsonSerializable()
class DataOtpResend {
  final String token;

  const DataOtpResend(
      this.token
      );

  factory DataOtpResend.fromJson(Map<String, dynamic> json) => _$DataOtpResendFromJson(json);

  Map<String, dynamic> toJson() => _$DataOtpResendToJson(this);
}

@JsonSerializable()
class OtpResendResponse extends BaseResponse{
  final DataOtpResend? data;

  OtpResendResponse(
      this.data,
      );

  factory OtpResendResponse.fromJson(Map<String, dynamic> json) => _$OtpResendResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResendResponseToJson(this);
}
