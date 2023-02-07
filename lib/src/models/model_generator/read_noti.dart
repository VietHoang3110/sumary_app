
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'read_noti.g.dart';

@JsonSerializable()
class ReadNoti{
  @JsonKey(name: "_id")
  final String? id;

  ReadNoti(this.id);

  factory ReadNoti.fromJson(Map<String, dynamic> json) => _$ReadNotiFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNotiToJson(this);
}

@JsonSerializable()
class ReadNotiResponse  extends BaseResponse{

  ReadNotiResponse? data;

  ReadNotiResponse(this.data);

  factory ReadNotiResponse.fromJson(Map<String, dynamic> json) => _$ReadNotiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNotiResponseToJson(this);
}
