import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'register.g.dart';


@JsonSerializable()
class DataRegister {
  final String token;

  const DataRegister(
      this.token
      );

  factory DataRegister.fromJson(Map<String, dynamic> json) => _$DataRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$DataRegisterToJson(this);
}

@JsonSerializable()
class RegisterResponse extends BaseResponse{
  final DataRegister? data;


  RegisterResponse(
      this.data,
      );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
