import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'introduce.g.dart';

@JsonSerializable()
class IntroduceResponse extends BaseResponse{
  final List<IntroduceData> data;

   IntroduceResponse(this.data);

  factory IntroduceResponse.fromJson(Map<String, dynamic> json) => _$IntroduceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IntroduceResponseToJson(this);
}

@JsonSerializable()
class IntroduceData {
  @JsonKey(name: "_id")
  final String id;
  final int order;
  final String pathImage, title,content,createdAt,updatedAt;

  IntroduceData(
      this.id, this.order,
      this.pathImage, this.title,
      this.content, this.createdAt,
      this.updatedAt);

  factory IntroduceData.fromJson(Map<String, dynamic> json) => _$IntroduceDataFromJson(json);

  Map<String, dynamic> toJson() => _$IntroduceDataToJson(this);
}
