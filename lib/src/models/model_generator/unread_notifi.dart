
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'unread_notifi.g.dart';


@JsonSerializable()
class UnreadNotifiResponse  extends BaseResponse{

  int data;

  UnreadNotifiResponse(this.data);

  factory UnreadNotifiResponse.fromJson(Map<String, dynamic> json) => _$UnreadNotifiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnreadNotifiResponseToJson(this);
}
