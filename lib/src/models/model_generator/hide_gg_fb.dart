import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'hide_gg_fb.g.dart';




@JsonSerializable()
class HideGGFB {
  @JsonKey(name: "_id")
  final String? id;
  final int? value;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;



  HideGGFB(this.id, this.value, this.createdAt, this.updatedAt, this.v);

  factory HideGGFB.fromJson(Map<String, dynamic> json) => _$HideGGFBFromJson(json);

  Map<String, dynamic> toJson() => _$HideGGFBToJson(this);
}


@JsonSerializable()
class HideGGFBResponse extends BaseResponse {
  final HideGGFB data;


  HideGGFBResponse(this.data);


  factory HideGGFBResponse.fromJson(Map<String, dynamic> json) => _$HideGGFBResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HideGGFBResponseToJson(this);
}

