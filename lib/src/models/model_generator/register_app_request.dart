import 'package:json_annotation/json_annotation.dart';

import 'index.dart';

part 'register_app_request.g.dart';

@JsonSerializable()
class RegisterAppRequest {
  final String name;
  final String email;
  final String password;
  final String? referrer;
  RegisterAppRequest({required this.name, required this.email, required this.password,this.referrer});
  factory RegisterAppRequest.fromJson(Map<String, dynamic> json) => _$RegisterAppRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterAppRequestToJson(this);
}