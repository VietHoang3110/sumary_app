import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';

part 'base_response.g.dart';


@JsonSerializable()
class BaseResponse {
   int? statusCode;
   String? message;

  BaseResponse({this.statusCode, this.message,});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}


