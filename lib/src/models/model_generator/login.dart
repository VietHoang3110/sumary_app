import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'login.g.dart';

@JsonSerializable()
class DataLogin {
  final String token;

  const DataLogin(
      this.token
      );

  factory DataLogin.fromJson(Map<String, dynamic> json) => _$DataLoginFromJson(json);

  Map<String, dynamic> toJson() => _$DataLoginToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse{
  final DataLogin? data;


  LoginResponse(
    this.data,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
