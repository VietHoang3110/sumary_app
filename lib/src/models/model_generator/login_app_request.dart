import 'package:json_annotation/json_annotation.dart';

import 'info_user.dart';

part 'login_app_request.g.dart';

@JsonSerializable()
class LoginAppRequest {
  @JsonKey(name: "email")
  final String email;
  final String password;
  final String token_firebase;
  LoginAppRequest({required this.email, required this.password, required this.token_firebase});
  factory LoginAppRequest.fromJson(Map<String, dynamic> json) => _$LoginAppRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginAppRequestToJson(this);
}

@JsonSerializable()
class LoginGoogleAndFacebookRequest {
  final String token;
  final String token_device;
  LoginGoogleAndFacebookRequest({required this.token,required this.token_device});
  factory LoginGoogleAndFacebookRequest.fromJson(Map<String, dynamic> json) => _$LoginGoogleAndFacebookRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginGoogleAndFacebookRequestToJson(this);
}


