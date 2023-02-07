import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'otp_register.g.dart';


@JsonSerializable()
class DataOtpRegister {
  final String token;

    const DataOtpRegister(
      this.token
      );

  factory DataOtpRegister.fromJson(Map<String, dynamic> json) => _$DataOtpRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$DataOtpRegisterToJson(this);
}

@JsonSerializable()
class OtpRegisterResponse extends BaseResponse{
  final DataOtpRegister? data;

  OtpRegisterResponse(
      this.data,
      );

  factory OtpRegisterResponse.fromJson(Map<String, dynamic> json) => _$OtpRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRegisterResponseToJson(this);
}
