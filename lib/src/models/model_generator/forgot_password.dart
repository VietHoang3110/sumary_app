import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'forgot_password.g.dart';

@JsonSerializable()
class DataForgotPassword {
  final String token;

  const DataForgotPassword(
      this.token
      );

  factory DataForgotPassword.fromJson(Map<String, dynamic> json) => _$DataForgotPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$DataForgotPasswordToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse{
  final DataForgotPassword? data;


  ForgotPasswordResponse(
      this.data,
      );

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
