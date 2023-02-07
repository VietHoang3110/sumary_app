import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';
part 'change_password_request.g.dart';


@JsonSerializable()
class ChangePasswordRequest {
  final String password;
  final String newPassword;


  ChangePasswordRequest(this.password, this.newPassword);

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}

