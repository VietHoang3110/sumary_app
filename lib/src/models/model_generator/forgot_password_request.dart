import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';
part 'forgot_password_request.g.dart';


@JsonSerializable()
class ForgotPasswordRequest {
  final String email;


  ForgotPasswordRequest(this.email);

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}

