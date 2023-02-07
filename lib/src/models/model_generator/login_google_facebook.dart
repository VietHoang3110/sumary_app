import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'login_google_facebook.g.dart';

@JsonSerializable()
class DataLoginGGAndFB {
  final String token;

  const DataLoginGGAndFB(
      this.token
      );

  factory DataLoginGGAndFB.fromJson(Map<String, dynamic> json) => _$DataLoginGGAndFBFromJson(json);

  Map<String, dynamic> toJson() => _$DataLoginGGAndFBToJson(this);
}

@JsonSerializable()
class LogoFBAndGGResponse extends BaseResponse{
  final DataLoginGGAndFB data;

  LogoFBAndGGResponse(this.data);

  factory LogoFBAndGGResponse.fromJson(Map<String, dynamic> json) => _$LogoFBAndGGResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoFBAndGGResponseToJson(this);
}