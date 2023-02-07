import 'package:json_annotation/json_annotation.dart';
part 'params_change_password.g.dart';
@JsonSerializable()
class ParamChangePassword {
  @JsonKey(name: "old_password")
  String oldPass;
  @JsonKey(name: "password_new")
  String newPass;
  @JsonKey(name: "password_new_confirmation")
  String repeatPass;

  ParamChangePassword(
      {
        required this.oldPass,
        required this.newPass,
        required this.repeatPass,
        });

  factory ParamChangePassword.fromJson(Map<String, dynamic> json) => _$ParamChangePasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ParamChangePasswordToJson(this);
}

@JsonSerializable()
class ParamForgotPassword {
  String email;

  ParamForgotPassword(
      {
        required this.email,
      });

  factory ParamForgotPassword.fromJson(Map<String, dynamic> json) => _$ParamForgotPasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ParamForgotPasswordToJson(this);
}

@JsonSerializable()
class ParamResetPassword {
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "new_password")
  String newPass;
  @JsonKey(name: "token")
  String token;

  ParamResetPassword(
      {
        required this.email,
        required this.newPass,
        required this.token,
      });

  factory ParamResetPassword.fromJson(Map<String, dynamic> json) => _$ParamResetPasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ParamResetPasswordToJson(this);
}

